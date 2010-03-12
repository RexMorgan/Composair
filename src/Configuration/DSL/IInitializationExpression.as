package Configuration.DSL
{
	import flash.utils.Dictionary;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public interface IInitializationExpression
	{
		function For(pluginType : ClassInfo) : GenericFamilyExpression;
		function Register(pluginType : ClassInfo, concreteType : ClassInfo) : void;
		function buildGraph() : Dictionary;
	}
}