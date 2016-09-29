/*
   Copyright aswing.org, see the LICENCE.txt.
 */

package devoron.aswing3d.skinbuilder
{
	import org.aswing.GroundDecorator;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import devoron.aswing3d.*;
	import devoron.aswing3d.error.ImpMissError;
	import devoron.aswing3d.geom.IntRectangle;
	import devoron.aswing3d.graphics.Graphics2D;
	import devoron.aswing3d.plaf.ComponentUI;
	import devoron.aswing3d.plaf.DefaultsDecoratorBase;
	import devoron.aswing3d.plaf.UIResource;
	
	public class OrientableComponentBackground extends DefaultsDecoratorBase implements GroundDecorator, UIResource
	{
		protected var verticalImage:DisplayObject;
		protected var horizotalImage:DisplayObject;
		protected var verticalDisabledImage:DisplayObject;
		protected var horizotalDisabledImage:DisplayObject;
		protected var lastImage:DisplayObject;
		protected var imageContainer:Sprite;
		protected var loaded:Boolean;
		
		public function OrientableComponentBackground()
		{
			imageContainer = AsWingUtils.createSprite(null, "imageContainer");
			//imageContainer.mouseChildren = false;
			loaded = false;
		}
		
		protected function checkReloadAssets(c:Component):void
		{
			if (!loaded)
			{
				var ui:ComponentUI = getDefaultsOwner(c);
				verticalImage = ui.getInstance(getPropertyPrefix() + "verticalBGImage") as DisplayObject;
				horizotalImage = ui.getInstance(getPropertyPrefix() + "horizotalBGImage") as DisplayObject;
				verticalDisabledImage = ui.getInstance(getPropertyPrefix() + "verticalBGDisabledImage") as DisplayObject;
				horizotalDisabledImage = ui.getInstance(getPropertyPrefix() + "horizotalBGDisabledImage") as DisplayObject;
				//default
				if (horizotalImage)
				{
					imageContainer.addChild(horizotalImage);
					lastImage = horizotalImage;
				}
				loaded = true;
			}
		}
		
		protected function getPropertyPrefix():String
		{
			throw new ImpMissError();
			return null;
		}
		
		public function updateDecorator(c:Component, g:Graphics2D, bounds:IntRectangle):void
		{
			checkReloadAssets(c);
			var bar:Orientable = Orientable(c);
			imageContainer.x = bounds.x;
			imageContainer.y = bounds.y;
			var image:DisplayObject;
			if (bar.getOrientation() == AsWingConstants.HORIZONTAL)
			{
				if ((!c.isEnabled()) && horizotalDisabledImage)
				{
					image = horizotalDisabledImage;
				}
				else
				{
					image = horizotalImage;
				}
			}
			else
			{
				if ((!c.isEnabled()) && verticalDisabledImage)
				{
					image = verticalDisabledImage;
				}
				else
				{
					image = verticalImage;
				}
			}
			
			if (image != lastImage)
			{
				if (lastImage)
				{
					imageContainer.removeChild(lastImage);
				}
				if (image)
				{
					imageContainer.addChild(image);
				}
				lastImage = image;
			}
			if (image)
			{
				image.width = bounds.width;
				image.height = bounds.height;
			}
		}
		
		public function getDisplay(c:Component):DisplayObject
		{
			checkReloadAssets(c);
			return imageContainer;
		}
	
	}
}