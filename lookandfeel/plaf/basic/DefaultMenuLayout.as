/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package devoron.aswing3d.plaf.basic{

import org.aswing.layouts.SoftBoxLayout;
import org.aswing.lookandfeel.plaf.UIResource;
import org.aswing.AsWingConstants;

/**
 * @private
 */
public class DefaultMenuLayout extends SoftBoxLayout implements UIResource{
	/**
     * Specifies that components should be laid out left to right.
     */
    public static const X_AXIS:int = 0;
    
    /**
     * Specifies that components should be laid out top to bottom.
     */
    public static const Y_AXIS:int = 1;
    
	public function DefaultMenuLayout(axis:int, gap:int=0, align:int=AsWingConstants.LEFT){
		super(axis, gap, align);
	}
	
}
}