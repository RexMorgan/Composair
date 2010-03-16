package com.composair.testing
{
	import com.composair.automocking.AutoMocker;
	
	import flexunit.framework.TestCase;
	
	import org.spicefactory.lib.reflect.ClassInfo;
	import org.spicefactory.lib.reflect.types.Void;
	
	public class InteractionContext extends TestCase
	{
		private var _targetClass : ClassInfo; 
		private var _autoMocker : AutoMocker;
		public function InteractionContext(targetClass : ClassInfo)
		{
			_targetClass = targetClass;
			_autoMocker = new AutoMocker(targetClass);
		}
		[RunBefores]
		public override function setUp() : void
		{
			super.setUp();
			
			// setup services
			beforeEach();	
		}
		
		public function mockFor(mockType : ClassInfo) : Object
		{
			return _autoMocker.getInstance(mockType);
		}
		
		public function get classUnderTest() : Object
		{
			return _autoMocker.classUnderTest;
		}
		
		protected virtual function beforeEach() : void
		{
		}
		
		public function verifyCallsFor(pluginType : ClassInfo) : void
		{
			_autoMocker.verifyCallsFor(pluginType);			
		}
		
		public function replayFor(pluginType : ClassInfo) : void
		{
			_autoMocker.replayFor(pluginType);
		}
	}
}