package IocSpike
{
	import flash.utils.*;
	public class Type
	{
		private var _typeDescriptor : XML;
		public function Type(typeDescriptor : XML)
		{
			_typeDescriptor = typeDescriptor;	
		}

		public static function Of(className:*) : Type
		{
			return new Type(describeType(className));
		}
		
		public function getClass() : Class
		{
			return _typeDescriptor as Class;
		}
		
		public function getName() : String
		{
			return _typeDescriptor..accessor.@name;
		}
	}
}