//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class CosinusView: OneOverXView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        var ctr: Double = Double(-self.maximumCoordinate) // -10000 is the original
        
        let finalValue = fabs(ctr)
        

        if self.appDelegate!.shouldDrawCos {
            let currentSegment = CartesianBezierPath(cartesianPlanView: self)
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
            let howManyPixelsInUnit = appDelegate.numberOfPixelsInUnit
            
            let firstCorrectY = self.performCosinus(Double(ctr)) * howManyPixelsInUnit
            
            
            currentSegment.move(to: NSPoint.init(x: ctr * howManyPixelsInUnit, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr * howManyPixelsInUnit
                var correctY = ctr
                
                correctY = self.performCosinus(Double(ctr)) * howManyPixelsInUnit
                                    
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                ctr += 0.01
            } while(ctr < finalValue)
            NSColor.red.set()
            currentSegment.stroke()
        }
        
    }

    func performCosinus(_ x: Double) -> Double {
        
        return cos(x)
        
    }
}


