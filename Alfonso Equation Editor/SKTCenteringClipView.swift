//
//  SKTCenteringClipView.swift
//  Sketch
//
//  Created by Alfonso Maria Tesauro on 26/04/2018.
//

import Cocoa

class SKTCenteringClipView: NSClipView {
    
    override func constrainBoundsRect(_ proposedClipViewBoundsRect: NSRect) -> NSRect {
        var constrainedClipViewBoundsRect = super.constrainBoundsRect(proposedClipViewBoundsRect)
        
        guard let documentView = self.documentView else {
            return constrainedClipViewBoundsRect
        }
        
        let documentViewFrameRect = documentView.bounds
        
        // If proposed clip view bounds width is greater than document view frame width, center it horizontally.
        if proposedClipViewBoundsRect.size.width >= documentViewFrameRect.size.width {
            // Adjust the proposed origin.x
            constrainedClipViewBoundsRect.origin.x = centeredCoordinateUnit(
                clipDimension: proposedClipViewBoundsRect.size.width,
                docDimension: documentViewFrameRect.size.width
            )
        }
        
        // If proposed clip view bounds height is greater than document view frame height, center it vertically.
        if proposedClipViewBoundsRect.size.height >= documentViewFrameRect.size.height {
            // Adjust the proposed origin.y
            constrainedClipViewBoundsRect.origin.y = centeredCoordinateUnit(
                clipDimension: proposedClipViewBoundsRect.size.height,
                docDimension: documentViewFrameRect.size.height
            )
        }
        
        return constrainedClipViewBoundsRect
    }
    
    private func centeredCoordinateUnit(clipDimension: CGFloat, docDimension: CGFloat) -> CGFloat {
        return round((docDimension - clipDimension) / 2.0)
    }
    
    override var isFlipped: Bool {
        return true
    }
}
