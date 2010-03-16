package com.composair
{
	import com.composair.configuration.dsl.IInitializationExpression;
	import com.composair.configuration.dsl.InitializationExpression;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	import org.spicefactory.lib.reflect.Constructor;
	import org.spicefactory.lib.reflect.Parameter;

	public class Container implements IContainer
	{
		private var _typeCache : HashTable;
		public function Container(typeCache : HashTable = null)
		{
			if(typeCache == null)
			{
				_typeCache = new HashTable();
			}
			else
			{
				_typeCache = typeCache;
			}
		}
 
		public function getInstance(pluginType : ClassInfo) : Object
		{
			if(!_typeCache.containsKey(pluginType.name))
			{
				throw new Error("PluginType has not been registered. " + pluginType.name);
			}
			
			var value : Object = _typeCache.getItem(pluginType.name);
			
			// HACK: We're storing ClassInfo & Instances in the HashTable
			//	This can be refactored.
			var targetClassInfo : ClassInfo = value as ClassInfo;
			if(targetClassInfo == null)
			{
				return value;
			}
			var constructor : Constructor = targetClassInfo.getConstructor();			
			var constructorArguments : Array = new Array();
			var constructorParameters : Array = constructor.parameters;
			for each (var param : Parameter in constructorParameters)
			{				
				// If the parameter is not required, we're going to stop.
				//	If we were to keep going, the arguments would get messed up
				//	out of order, and null would be assigned to the optional
				//	parameters instead of whatever they have defined as their
				//	defaults.
				if(!param.required) { break; }
				
				constructorArguments.push(this.getInstance(param.type));
			}
			
			return targetClassInfo.newInstance(constructorArguments);
		}
		
		public function configure(expression : Function) : void
		{
			var initializationExpression : IInitializationExpression = new InitializationExpression();
			
			var scope : Object = new Object();
			var args : Array = new Array()
			{
				args[0] = initializationExpression;
			}
			
			expression.apply(scope, args);
			
			var graph : HashTable = initializationExpression.buildGraph();
			var keys : Array = graph.getAllKeys();
			for each(var key : * in keys)
			{
				_typeCache.addItem(key, graph.getItem(key));
			}
		}
		
		public function hasDefaultImplementationFor(pluginType : ClassInfo) : Boolean
		{
			return _typeCache.containsKey(pluginType.name);
		}
		
		public function inject(pluginType : ClassInfo, instance : Object) : void
		{
			configure(function(x : IInitializationExpression) : void 
			{
				x.For(pluginType).UseInstance(instance);
			});
		}
	}
}