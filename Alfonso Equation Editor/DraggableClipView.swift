//
//  DraggableClipView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 31/08/2020.
//  Copyright © 2020 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class DraggableClipView: SKTCenteringClipView
{
    private var clickPoint: NSPoint!
    private var originalOrigin: NSPoint!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.postsFrameChangedNotifications = true
        self.postsBoundsChangedNotifications = true
        
        let _ = NotificationCenter.default.addObserver(forName:NSView.frameDidChangeNotification , object: nil, queue: nil) { (note1) in
           // print("Eccoci \((note1.object as! NSView).frame.size.width)")
        }
        let _ = NotificationCenter.default.addObserver(forName:NSView.boundsDidChangeNotification , object: nil, queue: nil) { (note2) in
                  // print("Eccoci2 \((note2.object as! NSView).frame.size.width)")
               }
    }
    
    
    override func mouseDown(with event: NSEvent) {
        clickPoint = event.locationInWindow
        originalOrigin = bounds.origin
    }

    override func mouseDragged(with event: NSEvent) {
        // Account for a magnified parent scrollview.
        let scale = (superview as? NSScrollView)?.magnification ?? 1.0
        let newPoint = event.locationInWindow
        
        let halfSizeOfPlan = self.bounds.size.width / 2
        
        var newX = originalOrigin.x + (clickPoint.x - newPoint.x) / scale
        
        let difference = halfSizeOfPlan - newX
        
        newX = halfSizeOfPlan + difference
        
        var newY = originalOrigin.y + (clickPoint.y - newPoint.y) / scale
        
        let difference2 = halfSizeOfPlan - newY
        
        //newY = halfSizeOfPlan + difference2
        
        let newOrigin = NSPoint(x: newX,
                                y: newY)
        let constrainedRect = constrainBoundsRect(NSRect(origin: newOrigin, size: bounds.size))
        scroll(to: constrainedRect.origin)
        superview?.reflectScrolledClipView(self)
    }

    override func mouseUp(with event: NSEvent) {
        clickPoint = nil
    }
}
