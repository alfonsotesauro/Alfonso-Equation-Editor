//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa




class SinusView: CartesianView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        let steps = 1000.0
            
        var ctr = -10000.0
        
        let finalValue = fabs(ctr)
        
        let height = self.frame.size.height
        let width = self.frame.size.width
        
        let distanceBetweenHorizontalLines = Double(height) / steps
        let distanceBetweenVerticalLines = Double(width) / steps
        
        let currentSegment = NSBezierPath.init()
        var firstCorrectY = sin(Double(Int((ctr * distanceBetweenVerticalLines))))
               
        firstCorrectY = firstCorrectY + Double(height / 2)
                
        currentSegment.move(to: NSPoint.init(x: 0, y: firstCorrectY))

        repeat {
            
            
            var correctX = ctr * distanceBetweenVerticalLines
            
            correctX = correctX + Double(width / 2)
            
            var correctY = sin(Double(Int(((ctr / 8) * distanceBetweenVerticalLines))))
        
            correctY = correctY + Double(height / 2)
            
            if correctY < 0 {
                print("Eccoci")
            }
            
            
            
           // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
            currentSegment.curve(to: NSPoint.init(x: correctX + 3, y: correctY), controlPoint1: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint2: NSPoint.init(x: correctX + 3.0, y: correctY))
            
            
            //currentSegment.line(to: NSPoint.init(x: ctr * distanceBetweenVerticalLines + 2.5, y: Double(Int(((ctr * distanceBetweenVerticalLines)) )^2)))
            
           
            
            
        ctr += 1
        } while(ctr < finalValue)
        NSColor.red.set()
        currentSegment.stroke()
    }
    
    override var isOpaque: Bool {
        return true
    }
    
}
