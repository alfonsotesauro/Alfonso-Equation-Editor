//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class CartesianBackgroundView: AbstractEquationView {
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.

        // White background is always drawn.
        let backgroundRect = NSBezierPath(rect: bounds)

        NSColor.white.set()

        backgroundRect.fill()
        
        // Checkbox can disable grid drawing.
    }
}


