//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class GridView: CartesianBackgroundView {
    

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Checkbox can disable grid drawing.
        if !appDelegate!.shouldDrawGrid {
            return
        }
        
        let color = NSColor.black
        color.set()


        let contourPath = NSBezierPath(rect: bounds)

        contourPath.stroke()
        
        var verticalLines: [NSBezierPath] = [NSBezierPath]()
        
        var ctr = 0.0
        
        let distanceBetweenVerticalLines = self.distanceBetweenVerticalLines * self.appDelegate.firstSliderDoubleValue
        
        repeat {
            let path = NSBezierPath()

            path.move(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr) + width / 2, y: 0))
            path.line(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr) + width / 2, y: height))
            path.move(to: NSPoint(x: width / 2 - CGFloat(distanceBetweenVerticalLines * ctr), y: 0))
            path.line(to: NSPoint(x: width / 2 - CGFloat(distanceBetweenVerticalLines * ctr), y: height))

            path.lineWidth = 0.5

            
                path.move(to: NSPoint(x: 0, y: CGFloat(distanceBetweenVerticalLines * ctr) + height / 2))
                path.line(to: NSPoint(x: width, y: CGFloat(distanceBetweenVerticalLines * ctr) + height / 2))

                path.move(to: NSPoint(x: 0, y: height / 2 - CGFloat(distanceBetweenVerticalLines * ctr)))
                path.line(to: NSPoint(x: width, y: height / 2 - CGFloat(distanceBetweenVerticalLines * ctr)))
           
            verticalLines.append(path)
            ctr += 1.0
        } while ctr < steps

        for (index, item) in verticalLines.enumerated() {
            if index % 5 == 0, index != 0 {
                NSColor.black.set()
            } else {
                NSColor.lightGray.set()
            }

            item.stroke()
        }
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^: PowerPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
