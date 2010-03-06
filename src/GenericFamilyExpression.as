package IocSpike
{
	public class GenericFamilyExpression
	{
		private var _pluginType : Type;
		private var _registry : IInitializationExpression;
		public function GenericFamilyExpression(pluginType : Type, registry : IInitializationExpression)
		{
			_pluginType = pluginType;
			_registry = registry;
		}
		
		public function Use(concreteType : Type) : void
		{
			_registry.Register(_pluginType, concreteType);
		}
	}
}