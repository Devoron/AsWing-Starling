/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package devoron.aswing3d.skinbuilder{
	
import devoron.aswing3d.*;
import devoron.aswing3d.error.ImpMissError;
import devoron.aswing3d.geom.IntRectangle;
import devoron.aswing3d.graphics.Graphics2D;
import devoron.aswing3d.graphics.SolidBrush;
import devoron.aswing3d.plaf.*;
import org.aswing3d.EditableComponent;
import org.aswing3d.GroundDecorator;
import starling.display.DisplayObject;
import starling.display.Sprite;

public class SkinAbsEditorBackground extends DefaultsDecoratorBase implements GroundDecorator, UIResource{
	
	protected var imageContainer:Sprite;
	protected var defaultImage:DisplayObject;
	protected var uneditableImage:DisplayObject;
	protected var disabledImage:DisplayObject;
	protected var lastViewedImage:DisplayObject;
	
	protected var loaded:Boolean;
	
	public function SkinAbsEditorBackground(){
		imageContainer = AsWingUtils.createSprite(null, "imageContainer");
		//imageContainer.mouseChildren = false;
		//imageContainer.mouseEnabled = false;
		loaded = false;
	}
	
	protected function getPropertyPrefix():String {
        throw new ImpMissError();
        return null;
    }
	
    protected function isEditable(c:Component):Boolean{
        var text:EditableComponent = EditableComponent(c);
        return text.isEditable();
    }
    
    protected function reloadAssets(ui:ComponentUI):void{
    	var pp:String = getPropertyPrefix();
    	addImage(defaultImage = ui.getInstance(pp+"defaultImage") as DisplayObject);
    	addImage(uneditableImage = ui.getInstance(pp+"uneditableImage") as DisplayObject);
    	addImage(disabledImage = ui.getInstance(pp+"disabledImage") as DisplayObject);
    	defaultImage.visible = true;
    	lastViewedImage = defaultImage;
    }
    
    protected function addImage(image:DisplayObject):void{
    	if(image){
    		image.visible = false;
    		imageContainer.addChild(image);
    	}
    }
	
	public function updateDecorator(c:Component, g:Graphics2D, b:IntRectangle):void{
		if(!loaded){
			reloadAssets(getDefaultsOwner(c));
			loaded = true;
		}
		
		var image:DisplayObject = null;
		if(!c.isEnabled()){
			image = disabledImage;
		}else if(!isEditable(c)){
			image = uneditableImage;
		}
		if(image == null) image = defaultImage;
		if(lastViewedImage != image){
			lastViewedImage.visible = false;
			lastViewedImage = image;
			lastViewedImage.visible = true;
		}
		//not use bounds, avoid the border
		lastViewedImage.width = c.width;
		lastViewedImage.height = c.height;
		
		if(c.isOpaque()){
			g.fillRectangle(new SolidBrush(c.getBackground()), b.x, b.y, b.width, b.height);
		}
	}
	
	public function getDisplay(c:Component):DisplayObject{
		return imageContainer;
	}
	
}
}