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
        

        let distanceBetweenVerticalLines = appDelegate.numberOfPixelsInUnit / 5
        repeat {
    let path = CartesianBezierPath(cartesianPlanView: self)
            
            path.move(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr), y: -halfHeight))
            path.line(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr), y: halfHeight))
            path.move(to: NSPoint(x: -CGFloat(distanceBetweenVerticalLines * ctr), y: -halfHeight))
            path.line(to: NSPoint(x: -CGFloat(distanceBetweenVerticalLines * ctr), y: halfHeight))
            
            
            path.lineWidth = 0.5
            
            //////////
            path.move(to: NSPoint(x: -halfWidth, y: CGFloat(distanceBetweenVerticalLines * ctr)))
            path.line(to: NSPoint(x: halfWidth, y: CGFloat(distanceBetweenVerticalLines * ctr)))
            
            path.move(to: NSPoint(x: -halfWidth, y: 0 - CGFloat(distanceBetweenVerticalLines * ctr)))
            path.line(to: NSPoint(x: halfWidth, y: 0 - CGFloat(distanceBetweenVerticalLines * ctr)))
            
            verticalLines.append(path)
            ctr += 1.0
            
        } while ctr < 200
        
        for (index, item) in verticalLines.enumerated() {
            if index % 5 == 0, index != 0 {
                NSColor.black.set()
            } else {
                NSColor.lightGray.set()
            }
            
            item.stroke()
        }
    }
    
    
    func draw2(_ dirtyRect: NSRect) {
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
        

        repeat {
    let path = CartesianBezierPath(cartesianPlanView: self)
            
            path.move(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr), y: -halfHeight))
            path.line(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr), y: halfHeight))
            path.move(to: NSPoint(x: -CGFloat(distanceBetweenVerticalLines * ctr), y: -halfHeight))
            path.line(to: NSPoint(x: -CGFloat(distanceBetweenVerticalLines * ctr), y: halfHeight))
            
            
            path.lineWidth = 0.5
            
            //////////
            path.move(to: NSPoint(x: -halfWidth, y: CGFloat(distanceBetweenVerticalLines * ctr)))
            path.line(to: NSPoint(x: halfWidth, y: CGFloat(distanceBetweenVerticalLines * ctr)))
            
            path.move(to: NSPoint(x: -halfWidth, y: 0 - CGFloat(distanceBetweenVerticalLines * ctr)))
            path.line(to: NSPoint(x: halfWidth, y: 0 - CGFloat(distanceBetweenVerticalLines * ctr)))
            
            verticalLines.append(path)
            ctr += 1.0
        } while ctr < 200
        
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
