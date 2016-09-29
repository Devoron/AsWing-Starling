/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package devoron.aswing3d.skinbuilder{

import devoron.aswing3d.*;
import devoron.aswing3d.plaf.ComponentUI;
import devoron.aswing3d.plaf.basic.accordion.BasicAccordionHeader;
import org.aswing3d.AbstractButton;
import org.aswing3d.JButton;

public class SkinTabbedPaneTab extends BasicAccordionHeader{
	
	protected var topBG:SkinButtonBackground;
	protected var bottomBG:SkinButtonBackground;
	protected var leftBG:SkinButtonBackground;
	protected var rightBG:SkinButtonBackground;
	protected var tabPlacement:int;	
	protected var defaultsOwner:ComponentUI;
	
	public function SkinTabbedPaneTab(){
		super();
		tabPlacement = -1;
	}
	
	override public function setTabPlacement(tp:int):void{
		if(tabPlacement != tp){
			tabPlacement = tp;
			if(tp == JTabbedPane.TOP){
				button.setBackgroundDecorator(topBG);
			}else if(tp == JTabbedPane.LEFT){
				button.setBackgroundDecorator(leftBG);
			}else if(tp == JTabbedPane.RIGHT){
				button.setBackgroundDecorator(rightBG);
			}else{
				button.setBackgroundDecorator(bottomBG);
			}
			button.repaint();
		}
	}
	
	override protected function createHeaderButton():AbstractButton{
		var tb:JButton = new JButton();
		tb.setTextFilters([]);
		topBG = new SkinButtonBackground(getPropertyPrefix() + "top.tab.");
		bottomBG = new SkinButtonBackground(getPropertyPrefix() + "bottom.tab.");
		leftBG = new SkinButtonBackground(getPropertyPrefix() + "left.tab.");
		rightBG = new SkinButtonBackground(getPropertyPrefix() + "right.tab.");
		topBG.setDefaultsOwner(owner.getUI());
		bottomBG.setDefaultsOwner(owner.getUI());
		leftBG.setDefaultsOwner(owner.getUI());
		rightBG.setDefaultsOwner(owner.getUI());
		tb.setBackgroundDecorator(topBG);
		return tb;
	}
	
	protected function getPropertyPrefix():String{
		return "TabbedPane.";
	}
	
	override public function setSelected(b:Boolean):void{
		button.setSelected(b);
	}
}
}