package IocSpike
{
	import flash.utils.Dictionary;
	
	public interface IInitializationExpression
	{
		function For(pluginType:Type) : GenericFamilyExpression;
		function Register(pluginType : Type, concreteType : Type) : void;
		function buildGraph() : Dictionary;
	}
}