/*
   Copyright aswing.org, see the LICENCE.txt.
 */

package devoron.aswing3d.plaf.basic.icon
{
	import org.aswing.Icon;
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import flash.geom.Point;
	
	import devoron.aswing3d.*;
	import org.aswing.graphics.*;
	import org.aswing.lookandfeel.plaf.UIResource;
	
	/**
	 * @private
	 * @author iiley
	 */
	public class SolidArrowIcon implements Icon, UIResource
	{
		
		protected var shape:Shape;
		protected var width:Number;
		protected var height:Number;
		protected var arrow:Number;
		
		public function SolidArrowIcon(arrow:Number, size:Number, color:ASColor)
		{
			this.arrow = arrow;
			this.width = size;
			this.height = size;
			shape = new Shape();
			paintIconWithColor(color);
		}
		
		public function updateIcon(com:Component, g:Graphics2D, x:int, y:int):void
		{
			shape.x = x;
			shape.y = y;
		}
		
		public function paintIconWithColor(cl:ASColor):void
		{
			var x:int = 0;
			var y:int = 0;
			shape.graphics.clear();
			var g:Graphics2D = new Graphics2D(shape.graphics);
			var center:Point = new Point(x + width / 2, y + height / 2);
			var w:Number = width;
			var ps1:Array = new Array();
			ps1.push(nextPoint(center, arrow, w / 2 / 2));
			var back:Point = nextPoint(center, arrow + Math.PI, w / 2 / 2);
			ps1.push(nextPoint(back, arrow - Math.PI / 2, w / 2));
			ps1.push(nextPoint(back, arrow + Math.PI / 2, w / 2));
			
			g.fillPolygon(new SolidBrush(cl), ps1);
		}
		
		//nextPoint with Point
		protected function nextPoint(op:Point, direction:Number, distance:Number):Point
		{
			return new Point(op.x + Math.cos(direction) * distance, op.y + Math.sin(direction) * distance);
		}
		
		public function getIconHeight(c:Component):int
		{
			return height;
		}
		
		public function getIconWidth(c:Component):int
		{
			return width;
		}
		
		public function setArrow(arrow:Number):void
		{
			this.arrow = arrow;
		}
		
		public function getDisplay(c:Component):DisplayObject
		{
			return shape;
		}
	
	}
}