//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

let shuldDrawExactCenterRect = false

class ParabolaView: NumbersView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
    
        
        
        let distanceBetweenVerticalLines = self.distanceBetweenVerticalLines * multiplyFactor
        
        
        var ctr = -Double(width / 2) // -10000 is the original
        
        let finalValue = fabs(ctr)
        

        if self.appDelegate!.shouldDrawParabola {
            let currentSegment = NSBezierPath.init()
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
            var firstCorrectY = self.transformXIntoY(Double(ctr * distanceBetweenVerticalLines))
            
            firstCorrectY = firstCorrectY + Double(height / 2)
            
            currentSegment.move(to: NSPoint.init(x: 0, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr + Double(width / 2)
                var correctY = ctr + Double(height / 2)
                
                if self.appDelegate.shouldApplyParabolaDivisor {
                
                    correctY = self.transformXIntoY(Double(ctr)) / self.steps
                    
                } else {
                    correctY = self.transformXIntoY(Double(ctr))
                }
                
                correctY = correctY + Double(height / 2)
                
                
                
                
                // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                
                
                ctr += 3.0
            } while(ctr < finalValue)
            NSColor.red.set()
            currentSegment.stroke()
        }
        
      
        
      
        
        
        
    }
    func transformXIntoY(_ x: Double) -> Double {
        
        return x ^^ 2
        
    }
    
}
