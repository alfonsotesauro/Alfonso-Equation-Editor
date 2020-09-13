//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class AxesView: MillimeterGridView {
   

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if !appDelegate!.shouldDrawAxes {
            return
        }

        let axesPath = CartesianBezierPath(cartesianPlanView: self)
    
        axesPath.move(to: NSPoint(x: 0, y: -halfHeight))
        axesPath.line(to: NSPoint(x: 0, y: halfHeight))
        axesPath.line(to: NSPoint(x: 0 - 6, y: halfHeight - 10))
        axesPath.move(to: NSPoint(x: 0, y: halfHeight))
        
        axesPath.line(to: NSPoint(x: 0 + 6, y: halfHeight - 10))

        axesPath.move(to: NSPoint(x: -halfWidth, y: 0))
        
        axesPath.line(to: NSPoint(x: halfWidth, y: 0))
        axesPath.line(to: NSPoint(x: halfWidth - 10, y: 0 + 6))
        axesPath.move(to: NSPoint(x: halfWidth, y: 0))
        axesPath.line(to: NSPoint(x: halfWidth - 10, y: -6))
         
        NSColor.black.set()
        axesPath.lineWidth = 2.0
        axesPath.stroke()

    }
}
