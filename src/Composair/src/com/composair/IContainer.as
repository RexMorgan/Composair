package com.composair
{
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public interface IContainer
	{
		function hasDefaultImplementationFor(pluginType : ClassInfo) : Boolean;
		function getInstance(pluginType : ClassInfo) : Object;
		function configure(expression : Function) : void;
		function inject(pluginType : ClassInfo, instance : Object) : void;
	}
}