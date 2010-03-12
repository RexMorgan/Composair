package Configuration.DSL
{
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public class GenericFamilyExpression
	{
		private var _pluginType : ClassInfo;
		private var _registry : IInitializationExpression;
		public function GenericFamilyExpression(pluginType : ClassInfo, registry : IInitializationExpression)
		{
			_pluginType = pluginType;
			_registry = registry;
		}
 
		public function Use(concreteType : ClassInfo) : void
		{
			_registry.Register(_pluginType, concreteType);
		}
	}
}