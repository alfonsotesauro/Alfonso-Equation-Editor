//
//  SKTCenteringClipView.m
//  Sketch
//
//  Created by Alfonso Maria Tesauro on 26/04/2018.
//

#import "SKTCenteringClipView.h"

@implementation SKTCenteringClipView


- (NSRect)constrainBoundsRect:(NSRect)proposedClipViewBoundsRect {
    
    NSRect constrainedClipViewBoundsRect = [super constrainBoundsRect:proposedClipViewBoundsRect];
    
//    // Early out if you want to use the default NSClipView behavior.
//    if (self.centersDocumentView == NO) {
//        return constrainedClipViewBoundsRect;
//    }
    
    NSRect documentViewFrameRect = [self.documentView bounds];
    
    // If proposed clip view bounds width is greater than document view frame width, center it horizontally.
    if (proposedClipViewBoundsRect.size.width >= documentViewFrameRect.size.width) {
        // Adjust the proposed origin.x
        constrainedClipViewBoundsRect.origin.x = centeredCoordinateUnitWithProposedContentViewBoundsDimensionAndDocumentViewFrameDimension(proposedClipViewBoundsRect.size.width, documentViewFrameRect.size.width);
    }
    
    // If proposed clip view bounds is hight is greater than document view frame height, center it vertically.
    if (proposedClipViewBoundsRect.size.height >= documentViewFrameRect.size.height) {
        
        // Adjust the proposed origin.y
        constrainedClipViewBoundsRect.origin.y = centeredCoordinateUnitWithProposedContentViewBoundsDimensionAndDocumentViewFrameDimension(proposedClipViewBoundsRect.size.height, documentViewFrameRect.size.height);
    }
    
    return constrainedClipViewBoundsRect;
}


CGFloat centeredCoordinateUnitWithProposedContentViewBoundsDimensionAndDocumentViewFrameDimension( CGFloat clipDimension, CGFloat docDimension)
{
    CGFloat newOrigin;
    newOrigin = roundf((docDimension - clipDimension) / 2.0);
    return newOrigin;
}

@end
