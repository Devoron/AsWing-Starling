package org.aswing.resizer
{
	import org.aswing.components.Component;
	import org.aswing.resizer.Resizer;
	/**
	 * EmptyResizer
	 * @author DEVORON
	 */
	public class EmptyResizer implements Resizer
	{
		
		public function EmptyResizer() 
		{
			
		}
		
		/* INTERFACE devoron.aswing3d.resizer.Resizer */
		
		public function isEnabled():Boolean 
		{
			return true;
		}
		
		public function isResizeDirectly():Boolean 
		{
			return true;
		}
		
		public function setEnabled(b:Boolean):void 
		{
			
		}
		
		public function setOwner(c:Component):void 
		{
			
		}
		
		public function setResizeDirectly(r:Boolean):void 
		{
			
		}
		
	}

}