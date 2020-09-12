//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa


class AbsoluteValueView: RettaView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        
        let distanceBetweenVerticalLines = self.distanceBetweenVerticalLines * multiplyFactor
        
        
        var ctr = -Double(width / 2) // -10000 is the original
        
        var finalValue = fabs(ctr)
        
        
        //let distanceBetweenHorizontalLines = Double(height) / steps
        
        
        //let distanceBetweenHorizontalLines = Double(height) / steps
        
        
        if self.appDelegate!.shouldDrawAbsoluteValue {
            
            
            finalValue = fabs(ctr)
            
            let currentSegment2 = NSBezierPath.init()
            currentSegment2.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            var firstCorrectY2 = ctr * distanceBetweenVerticalLines
            
            firstCorrectY2 = firstCorrectY2 + Double(height / 2)
            
            currentSegment2.move(to: NSPoint.init(x: ctr, y: firstCorrectY2))
            
            repeat {
                
                
                var correctX = (ctr * distanceBetweenVerticalLines)
                
                correctX = correctX + Double(width / 2)
                
                var correctY = (ctr * distanceBetweenVerticalLines)
                
                correctY = correctY + Double(height / 2)
                
                let halfPlanHeight = Double(height / 2)
                
                if correctX < Double(width / 2) {
                    let difference = halfPlanHeight - correctY
                    correctY = halfPlanHeight + difference
                }
                
                
                currentSegment2.curve(to: NSPoint(x: correctX, y: correctY), controlPoint1: NSPoint(x: correctX, y: correctY), controlPoint2: NSPoint(x: correctX, y: correctY))
                
                
                
                ctr += 1.0
            } while(ctr < finalValue)
            NSColor.orange.set()
            currentSegment2.stroke()
        }
        
        
        
    }
   
    
}
