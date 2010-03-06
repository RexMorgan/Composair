package IocSpike
{
	import flash.utils.Dictionary;
	
	public class InitializationExpression implements IInitializationExpression
	{
		private var _typeDictionary : flash.utils.Dictionary;
		public function InitializationExpression()
		{
			_typeDictionary = new Dictionary(false);
		}
		
		public function For(pluginType:Type) : GenericFamilyExpression
		{
			return new GenericFamilyExpression(pluginType, this);
		}
		
		public function Register(pluginType : Type, concreteType : Type) : void
		{
			_typeDictionary[pluginType.getName()] = concreteType;
		}
		
		public function buildGraph() : Dictionary
		{
			return _typeDictionary;
		}
	}
}