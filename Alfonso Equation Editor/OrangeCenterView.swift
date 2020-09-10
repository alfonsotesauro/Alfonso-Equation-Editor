//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class OrangeCenterView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        var bounds = self.bounds
               
        bounds = bounds.insetBy(dx: 230, dy: 120)
               
        let exactPath = NSBezierPath(rect: bounds)
               
        NSColor.orange.set()
               
        exactPath.stroke()
        
    }
    
}
