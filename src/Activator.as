package IocSpike
{
	import mx.core.ClassFactory;
	
	public class Activator
	{
		public static function CreateInstance(type : Type) : Object
		{
			var classReference : Class = type.getClass();
			return new classReference();
		}
	}
}