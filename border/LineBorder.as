/*
   Copyright aswing.org, see the LICENCE.txt.
 */

package devoron.aswing3d.border
{
	
	//import flash.display.*;
	
	import flash.display.BitmapData;
	import org.aswing3d.Insets;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.textures.Texture;
	
	/**
	 * Line border, this will paint a rounded line for a component.
	 */
	public class LineBorder extends DecorateBorder
	{
		private var borderShape:Shape;
		private var color:ASColor;
		private var thickness:Number;
		private var round:Number;
		
		/**
		 * Create a line border.
		 * @param interior interior border. Default is null;
		 * @param color the color of the border. Default is null, means ASColor.BLACK
		 * @param thickness the thickness of the border. Default is 1
		 * @param round round rect radius, default is 0 means normal rectangle, not rect.
		 */
		public function LineBorder(interior:Border = null, color:ASColor = null, thickness:Number = 1, round:Number = 0)
		{
			super(interior);
			if (color == null)
				color = ASColor.BLACK;
			
			this.color = color;
			this.thickness = thickness;
			this.round = round;
			
			borderShape = new Shape();
		}
		
		override public function updateBorderImp(com:Component, g:Graphics2D, b:IntRectangle):void
		{
			var t:Number = thickness;
			borderShape.graphics.clear();
			g = new Graphics2D(borderShape.graphics);
			
			if (round <= 0)
			{
				g.drawRectangle(new Pen(color, thickness), b.x + t / 2, b.y + t / 2, b.width - t, b.height - t);
			}
			else
			{
				g.fillRoundRectRingWithThickness(new SolidBrush(color), b.x, b.y, b.width, b.height, round, t);
			}
		
			// отрисовать текстуру в спрайте
		/*var bmd:BitmapData = new BitmapData(drawingShape.width, drawingShape.height, true, 0x00000000);
		   bmd.draw(drawingShape);
		   var tex:Texture = Texture.fromBitmapData(bmd);
		   var img:Image = new Image(tex);
		 borderSprite.addChild(img);*/
		}
		
		override public function getBorderInsetsImp(com:Component, bounds:IntRectangle):Insets
		{
			var width:Number = Math.ceil(thickness + round - round * 0.707106781186547); //0.707106781186547 = Math.sin(45 degrees);
			return new Insets(width, width, width, width);
		}
		
		override public function getDisplayImp():DisplayObject
		{
			return borderShape;
		}
		
		public function getColor():ASColor
		{
			return color;
		}
		
		public function setColor(color:ASColor):void
		{
			this.color = color;
		}
		
		public function getThickness():Number
		{
			return thickness;
		}
		
		public function setThickness(thickness:Number):void
		{
			this.thickness = thickness;
		}
		
		public function getRound():Number
		{
			return round;
		}
		
		public function setRound(round:Number):void
		{
			this.round = round;
		}
	}
}