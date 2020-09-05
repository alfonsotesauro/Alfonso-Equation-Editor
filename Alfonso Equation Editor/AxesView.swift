//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class AxesView: CartesianView {
   

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if !appDelegate!.shouldDrawAxes {
            return
        }
        
        let height = frame.size.height
        let width = frame.size.width

        let axesPath = NSBezierPath()

        axesPath.move(to: NSPoint(x: width / 2, y: 0))
        axesPath.line(to: NSPoint(x: width / 2, y: height))
        axesPath.line(to: NSPoint(x: width / 2 - 6, y: height - 10))
        axesPath.move(to: NSPoint(x: width / 2, y: height))
        axesPath.line(to: NSPoint(x: width / 2 + 6, y: height - 10))

        axesPath.move(to: NSPoint(x: 0, y: height / 2))
        axesPath.line(to: NSPoint(x: width, y: height / 2))
        axesPath.line(to: NSPoint(x: width - 10, y: height / 2 + 6))
        axesPath.move(to: NSPoint(x: width, y: height / 2))
        axesPath.line(to: NSPoint(x: width - 10, y: height / 2 - 6))

        NSColor.black.set()
        axesPath.lineWidth = 2.0
        axesPath.stroke()

       
        
    }
}
