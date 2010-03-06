package IocSpike
{
	import flash.utils.Dictionary;
	public class Container implements IContainer
	{
		private var _typeDictionary : Dictionary;
		public function Container(typeDictionary : Dictionary)
		{
			_typeDictionary = typeDictionary;
		}
		
		public function GetInstance(pluginType : Type) : Object
		{
			return Activator.CreateInstance(_typeDictionary[pluginType.getName()]);
		}
	}
}