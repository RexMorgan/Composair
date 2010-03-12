package Configuration.DSL
{
	import flash.utils.Dictionary;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public class InitializationExpression implements IInitializationExpression
	{
		private var _typeDictionary : Dictionary;
		public function InitializationExpression()
		{
			_typeDictionary = new Dictionary(false);
		}
 
		public function For(pluginType : ClassInfo) : GenericFamilyExpression
		{
			return new GenericFamilyExpression(pluginType, this);
		}
 
		public function Register(pluginType : ClassInfo, concreteType : ClassInfo) : void
		{
			_typeDictionary[pluginType.name] = concreteType;
		}
 
		public function buildGraph() : Dictionary
		{
			return _typeDictionary;
		}
	}
}