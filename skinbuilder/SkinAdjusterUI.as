/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package devoron.aswing3d.skinbuilder{

import devoron.aswing3d.*;
import devoron.aswing3d.layout.BorderLayout;
import devoron.aswing3d.plaf.*;
import devoron.aswing3d.plaf.basic.BasicAdjusterUI;
import org.aswing.Insets;
import org.aswing.JButton;

public class SkinAdjusterUI extends BasicAdjusterUI{
	
	public function SkinAdjusterUI(){
		super();
	}
	
	override protected function createArrowButton():Component{
		var btn:JButton = new JButton();
		btn.setFocusable(false);
		btn.setBackgroundDecorator(null);
		btn.setMargin(new Insets(0, 0, 0, 0));
		var ico:SkinButtonIcon = new SkinButtonIcon(-1, -1, getPropertyPrefix()+"arrowButton.", adjuster);
		btn.setIcon(ico);
		return btn;
	}
	
	override protected function createPopupSliderUI():SliderUI{
		return new SkinAdjusterSliderUI();
	}
	
	override protected function getPopup():JPopup{
		if(popup == null){
			popup = new JPopup();
			popup.append(popupSlider, BorderLayout.CENTER);
		}
		return popup;
	}
}
}