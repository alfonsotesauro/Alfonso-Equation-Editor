//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

struct CartesianCoordinates {
    
    var x: CGFloat
    var y: CGFloat
    
    init(cocoaCoordinatesPoint: NSPoint, inView: NSView) {
        let viewFrame = inView.frame
        
        self.x = cocoaCoordinatesPoint.x + viewFrame.size.width / 2
        self.y = cocoaCoordinatesPoint.y + viewFrame.size.height / 2
        
    }
    
    
    
}


class ParabolaView: CartesianView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        let steps = 1000.0
            
        var ctr = -10000.0
        
        let finalValue = fabs(ctr)
        
        let height = self.frame.size.height
        let width = self.frame.size.width
        
        //let distanceBetweenHorizontalLines = Double(height) / steps
        let distanceBetweenVerticalLines = Double(width) / steps
        
        let currentSegment = NSBezierPath.init()
        var firstCorrectY = (ctr * distanceBetweenVerticalLines)^^2
               
        firstCorrectY = firstCorrectY + Double(height / 2)
                
        currentSegment.move(to: NSPoint.init(x: 0, y: firstCorrectY))

        repeat {
            
            
            var correctX = ctr * distanceBetweenVerticalLines
            
            correctX = correctX + Double(width / 2)
            
            var correctY = ((ctr / 8) * distanceBetweenVerticalLines)^^2
        
            correctY = correctY + Double(height / 2)
            
         
            
            
           // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
            currentSegment.curve(to: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint1: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint2: NSPoint.init(x: correctX + 3.0, y: correctY))
           
            
            
        ctr += 1
        } while(ctr < finalValue)
        NSColor.red.set()
        currentSegment.stroke()
    }
    
    override var isOpaque: Bool {
        return true
    }
    
}
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
