package
{
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public interface IContainer
	{
		function getInstance(pluginType : ClassInfo) : Object;
	}
}