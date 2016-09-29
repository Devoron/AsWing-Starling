package devoron.aswing3d.skinbuilder{

import devoron.aswing3d.*;
import devoron.aswing3d.plaf.basic.BasicStepperUI;
import org.aswing3d.Icon;
import org.aswing3d.Insets;
import org.aswing3d.JButton;


/**
 * @author iiley (Burstyx Studio)
 */
public class SkinStepperUI extends BasicStepperUI{
	
	public function SkinStepperUI(){
		super();
	}
	
	/**
	 * Just override this method if you want other LAF drop down buttons.
	 */
	override protected function createButton(direction:Number):Component{
		var icon:Icon 
		if(direction < 0){//up
			icon = new SkinButtonIcon(-1, -1, getPropertyPrefix()+"arrowUp.", stepper);
		}else{//down
			icon = new SkinButtonIcon(-1, -1, getPropertyPrefix()+"arrowDown.", stepper);
		}
		var btn:JButton = new JButton("", icon);
		btn.setFocusable(false);
		//btn.setPreferredSize(new IntDimension(15, 15));
		btn.setBackgroundDecorator(null);
		btn.setMargin(new Insets());
		btn.setBorder(null);
		//make it proxy to the stepper
		btn.setMideground(null);
		btn.setStyleTune(null);
		return btn;
	}	
}
}