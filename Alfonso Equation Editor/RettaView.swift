//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa


class RettaView: PowerOfThreeView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        
        //let distanceBetweenVerticalLines = self.distanceBetweenVerticalLines * multiplyFactor
        
        
        var ctr = -Double(width / 2) // -10000 is the original
        
        var finalValue = fabs(ctr)
        
        
        if self.appDelegate!.shouldDrawRetta {
        
        
        
        
        let currentSegment2 = NSBezierPath.init()
        currentSegment2.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
        var firstCorrectY2 = ctr * distanceBetweenVerticalLines
        
        firstCorrectY2 = firstCorrectY2 + 0 //Double(height / 2)
        
        currentSegment2.move(to: NSPoint.init(x: 0, y: firstCorrectY2))
        
        repeat {
            
            
            var correctX = (ctr * distanceBetweenVerticalLines) 
            
            correctX = correctX + Double(width / 2)
            
            var correctY = (ctr * distanceBetweenVerticalLines)
            
            correctY = correctY + Double(height / 2)
            
            
            
            
            // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
            currentSegment2.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
            
            
            
            ctr += 3.0
        } while(ctr < finalValue)
        NSColor.blue.set()
        currentSegment2.stroke()
    }
        
     
        
        
        
    }
   
    
}
