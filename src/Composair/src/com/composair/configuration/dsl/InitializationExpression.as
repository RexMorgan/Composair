package com.composair.configuration.dsl
{
	import com.composair.HashTable;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	import org.spicefactory.lib.reflect.types.Void;
	
	public class InitializationExpression implements IInitializationExpression
	{
		private var _typeDictionary : HashTable;
		public function InitializationExpression()
		{
			_typeDictionary = new HashTable();
		}
 
		public function For(pluginType : ClassInfo) : GenericFamilyExpression
		{
			return new GenericFamilyExpression(pluginType, this);
		}
 
		public function Register(pluginType : ClassInfo, concreteType : ClassInfo) : void
		{
			_typeDictionary.addItem(pluginType.name, concreteType);
		}
 
 		public function RegisterInstance(pluginType : ClassInfo, instance : Object) : void
 		{
 			_typeDictionary.addItem(pluginType.name, instance);
 		}
 
		public function buildGraph() : HashTable
		{
			return _typeDictionary;
		}
	}
}