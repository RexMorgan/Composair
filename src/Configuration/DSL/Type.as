package Configuration.DSL
{
	import flash.utils.describeType;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	import org.spicefactory.lib.util.ClassUtil;
	
	public class Type
	{
		public static function Of(classType : Class) : ClassInfo
		{
			var description : XML = describeType(classType);
			
			// Workaround for bug http://bugs.adobe.com/jira/browse/FP-183
			var constructorXML : XMLList = description.factory.constructor;
			
			if(constructorXML && constructorXML.length() > 0)
			{
				var parametersXML : XMLList = constructorXML[0].parameter;
				if(parametersXML && parametersXML.length() > 0)
				{
					// Instantiate class with all null arguments.
					var args : Array = [];
					for(var i : int = 0; i < parametersXML.length(); ++i)
					{
						args.push(null);
					}
					
					ClassUtil.createNewInstance(classType, args);
				}
			}			
			return ClassInfo.forClass(classType);
		}
	}
}