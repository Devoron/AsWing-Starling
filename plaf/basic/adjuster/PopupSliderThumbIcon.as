/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package devoron.aswing3d.plaf.basic.adjuster{
	
import devoron.aswing3d.plaf.basic.icon.SliderThumbIcon;
import devoron.aswing3d.Component;

/**
 * @private
 */
public class PopupSliderThumbIcon extends SliderThumbIcon{
	
	public function PopupSliderThumbIcon(){
		super();
	}
	
	override protected function getPropertyPrefix():String {
		return "Adjuster.";
	}	
	
	override public function getIconHeight(c:Component):int{
		return 12;
	}
	
	override public function getIconWidth(c:Component):int{
		return 12;
	}	
	
}
}