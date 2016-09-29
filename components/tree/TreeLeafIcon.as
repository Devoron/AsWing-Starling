/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package devoron.aswing3d.tree { 

import flash.geom.Point;
import devoron.aswing3d.Component;
import devoron.aswing3d.geom.IntRectangle;
import devoron.aswing3d.graphics.*;
import org.aswing.Icon;
import devoron.aswing3d.plaf.UIResource;
import flash.display.DisplayObject;
import flash.geom.Matrix;
import devoron.aswing3d.ASColor;

/**
 * The default leaf icon for JTree.
 * TODO draw a nicer icon
 * @author iiley
 */
public class TreeLeafIcon implements Icon, UIResource{
	
	public function TreeLeafIcon(){
	}
	
	public function getIconWidth(c:Component) : int {
		return 16;
	}

	public function getIconHeight(c:Component) : int {
		return 16;
	}

	public function updateIcon(com:Component, g:Graphics2D, x:int, y:int):void{
		var b:IntRectangle = new IntRectangle(0, 0, 16, 16);
		b.grow( -2, -1 );
		b.move( x, y );
		
		var foldSize:int = 4;
		var points:Array = new Array();
		points.push( new Point( b.x, 								b.y ) );
		points.push( new Point( b.width - foldSize, b.y ) );
		points.push( new Point( b.width, 						b.y + foldSize ) );
		points.push( new Point( b.width, 						b.height ) );
		points.push( new Point( b.x, 								b.height ) );
		
    var colors:Array = [0xE6E9EE, 0x8E94BD];
		var alphas:Array = [100/255, 100/255];
		var ratios:Array = [0, 255];
		var matrix:Matrix = new Matrix();
		matrix.createGradientBox(b.width, b.height, 0, b.x, b.y);     
    var brush:GradientBrush = new GradientBrush(GradientBrush.LINEAR, colors, alphas, ratios, matrix);
    g.fillPolygon(brush, points);
		
		g.drawPolygon(new Pen(ASColor.BLACK, 0.5), points );
		
		var foldPoints:Array = new Array();
		foldPoints.push( new Point( b.width - foldSize, b.y ) );
		foldPoints.push( new Point( b.width - foldSize, b.y + foldSize ) );
		foldPoints.push( new Point( b.width, 						b.y + foldSize ) );
		g.drawPolyline( new Pen(ASColor.BLACK, 0.5), foldPoints );
	}

	public function getDisplay(c:Component):DisplayObject{
		return null;
	}
}
}