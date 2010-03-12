package {
	import Configuration.DSL.IInitializationExpression;
	import Configuration.DSL.InitializationExpression;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public class ObjectFactory
	{
		private static var _container : IContainer;
		
		public static function Initialize(expression : Function) : void
		{
			var initializationExpression : IInitializationExpression = new InitializationExpression();
			
			var scope : Object = new Object();
			var args : Array = new Array()
			{
				args[0] = initializationExpression;
			}
			
			expression.apply(scope, args);
			
			_container = new Container(initializationExpression.buildGraph());
		}
		
		public static function getInstance(pluginType : ClassInfo) : Object
		{
			return _container.getInstance(pluginType);
		}
	}
}
