//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class MillimeterGridView: GridView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Checkbox can disable grid drawing.
        if !appDelegate!.shouldDrawMillimeterPaper {
            return
        }
        
        let color = NSColor.blue
        color.set()
        
        
        let contourPath = NSBezierPath(rect: bounds)
        
        contourPath.stroke()
        
        var verticalLines: [NSBezierPath] = [NSBezierPath]()
        
        var ctr = 0.0
        

        let distanceBetweenVerticalLines = appDelegate.numberOfPixelsInUnit / 20
        
        
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
        
        for (_, item) in verticalLines.enumerated() {
            
            
            item.stroke()
        }
    }
    
}


