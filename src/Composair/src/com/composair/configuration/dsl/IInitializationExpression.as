package com.composair.configuration.dsl
{
	import com.composair.HashTable;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public interface IInitializationExpression
	{
		function For(pluginType : ClassInfo) : GenericFamilyExpression;
		function Register(pluginType : ClassInfo, concreteType : ClassInfo) : void;
		function RegisterInstance(pluginType : ClassInfo, instance : Object) : void;
		function buildGraph() : HashTable;
	}
}