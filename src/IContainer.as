package IocSpike
{
	public interface IContainer
	{
		function GetInstance(pluginType : Type) : Object;
	}
}