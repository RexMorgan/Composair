package
{
	import flash.utils.Dictionary;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	import org.spicefactory.lib.reflect.Constructor;
	import org.spicefactory.lib.reflect.Parameter;
	import org.spicefactory.lib.util.ClassUtil;

	public class Container implements IContainer
	{
		private var _typeCache : Dictionary;
		public function Container(typeDictionary : Dictionary)
		{
			_typeCache = typeDictionary;
		}
 
		public function getInstance(pluginType : ClassInfo) : Object
		{
			var targetClassInfo : ClassInfo = _typeCache[pluginType.name];
			
			if(targetClassInfo == null)
			{
				throw new Error("PluginType has not been registered. " + pluginType.name);
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
	}
}