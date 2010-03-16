package com.composair.automocking
{
	import asmock.framework.MockRepository;
	
	import com.composair.Container;
	import com.composair.IContainer;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	
	public class AutoMocker
	{
		private var _targetClass : ClassInfo;
		private var _classUnderTest : Object;
		private var _container : IContainer;
		private var _mockRepository : MockRepository;
		
		public function AutoMocker(targetClass : ClassInfo)
		{
			_targetClass = targetClass;
			_container = new Container();
			_mockRepository = new MockRepository();
		}
		
		public function get classUnderTest() : Object
		{
			if(_classUnderTest == null)
			{
				_classUnderTest = _container.getInstance(_targetClass);
			}
			
			return _classUnderTest;
		}
		
		public function getInstance(pluginType : ClassInfo) : Object
		{
			if(!_container.hasDefaultImplementationFor(pluginType))
			{
				 var mockedPlugin : Object = _mockRepository.createStub(pluginType.getClass(), StubOptions.ALL);
				 _container.inject(pluginType, mockedPlugin);
			}
			
			return _container.getInstance(pluginType);
		}
		
		public function verifyCallsFor(pluginType : ClassInfo) : void
		{
			_mockRepository.verify(getInstance(pluginType));
		}
		
		public function replayFor(pluginType : ClassInfo) : void
		{
			_mockRepository.replay(getInstance(pluginType));
		}
	}
}