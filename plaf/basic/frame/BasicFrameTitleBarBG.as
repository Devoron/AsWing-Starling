package devoron.aswing3d.plaf.basic.frame{

import flash.display.DisplayObject;
import flash.geom.Matrix;

import devoron.aswing3d.ASColor;
import devoron.aswing3d.Component;
import org.aswing3d.FrameTitleBar;
import org.aswing3d.GroundDecorator;
import devoron.aswing3d.UIManager;
import devoron.aswing3d.geom.IntRectangle;
import devoron.aswing3d.graphics.GradientBrush;
import devoron.aswing3d.graphics.Graphics2D;
import devoron.aswing3d.graphics.Pen;
import devoron.aswing3d.plaf.FrameUI;
import devoron.aswing3d.plaf.UIResource;

public class BasicFrameTitleBarBG implements GroundDecorator, UIResource{
		
	protected var activeColor:ASColor;
	protected var inactiveColor:ASColor;
	protected var activeBorderColor:ASColor;
	
	public function BasicFrameTitleBarBG(){
		super();
	}

	public function getDisplay(c:Component):DisplayObject{
		return null;
	}
	
	public function updateDecorator(c:Component, g:Graphics2D, b:IntRectangle):void{
		return;
		var bar:FrameTitleBar = FrameTitleBar(c);
		var frameUI:FrameUI = bar.getFrame().getUI() as FrameUI;
		if(activeColor == null){
			var activeColor:ASColor;
			var inactiveColor:ASColor;
			if(frameUI){
				activeColor = frameUI.getColor("Frame.activeCaption");
				inactiveColor = frameUI.getColor("Frame.inactiveCaption");
				activeBorderColor = frameUI.getColor("Frame.activeCaptionBorder");
			}else{
				activeColor = UIManager.getColor("Frame.activeCaption");
				inactiveColor = UIManager.getColor("Frame.inactiveCaption");
				activeBorderColor = UIManager.getColor("Frame.activeCaptionBorder");
			}
		}
        var x:Number = b.x;
		var y:Number = b.y;
		var w:Number = b.width;
		var h:Number = b.height;
		
		var colors:Array;
		if(frameUI == null || frameUI.isPaintActivedFrame()){
	    	colors = [activeColor.darker(0.9).getRGB(), activeColor.getRGB()];
		}else{
	    	colors = [inactiveColor.darker(0.9).getRGB(), inactiveColor.getRGB()];
		}
		var alphas:Array = [1, 1];
		var ratios:Array = [75, 255];
		var matrix:Matrix = new Matrix();
		matrix.createGradientBox(w, h, (90/180)*Math.PI, x, y);
	    var brush:GradientBrush = new GradientBrush(GradientBrush.LINEAR, colors, alphas, ratios, matrix);
	    g.fillRoundRect(brush, x, y, w, h, 4, 4, 0, 0);    
		
		if(frameUI == null || frameUI.isPaintActivedFrame()){
			colors = [activeColor.getRGB(), activeColor.getRGB()];
		}else{
			colors = [inactiveColor.getRGB(), inactiveColor.getRGB()];
		}
        
		alphas = [1, 0];
		ratios = [0, 100];
        brush = new GradientBrush(GradientBrush.LINEAR, colors, alphas, ratios, matrix);
        g.fillRoundRect(brush, x, y, w, h-h/4, 4, 4, 0, 0);
        var penTool:Pen = new Pen(activeBorderColor);
        g.drawLine(penTool, x, y+h-1, x+w, y+h-1);		
	}
	
}
}