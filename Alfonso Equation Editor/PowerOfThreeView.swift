//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class PowerOfThreeView: ParabolaView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        
        
        
        let distanceBetweenVerticalLines = self.distanceBetweenVerticalLines * multiplyFactor
        
        
        var ctr = -Double(width / 2) // -10000 is the original
        
        var finalValue = fabs(ctr)
        
        
        if self.appDelegate!.shouldDrawPowerThree {
            
            ctr = -1000.0 // -10000 is the original
            
            finalValue = fabs(ctr)
            
            let currentSegment = NSBezierPath.init()
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            var firstCorrectY = self.transformXIntoY(Double(Int(ctr * distanceBetweenVerticalLines)))
            
            firstCorrectY = firstCorrectY + Double(height / 2)
            
            currentSegment.move(to: NSPoint.init(x: 0, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr + Double(width / 2)
                var correctY = ctr + Double(height / 2)
                
                correctY = self.transformXIntoY2(Double(ctr / 25))
                
                correctY = correctY + Double(height / 2)
                
                
                
                
                // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                
                
                ctr += 3.0
            } while(ctr < finalValue)
            NSColor.blue.set()
            currentSegment.stroke()
        }
       
        
    }
    
    
    func transformXIntoY2(_ x: Double) -> Double {
        
        return x ^^ 3
        
    }
}
