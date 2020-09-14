//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa


class OneOverXView: CrossView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
        var ctr = -5.0 // -10000 is the original
        
        let finalValue = fabs(ctr)
    
        if self.appDelegate!.shouldDrawOneOverX {
            let currentSegment = CartesianBezierPath(cartesianPlanView: self)
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
            let howManyPixelsInUnit = appDelegate.numberOfPixelsInUnit
            
            let firstCorrectY = self.performOneOverX(Double(ctr)) * howManyPixelsInUnit
            
            
            currentSegment.move(to: NSPoint.init(x: ctr * howManyPixelsInUnit, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr * howManyPixelsInUnit
                var correctY = ctr
                
                correctY = self.performOneOverX(Double(ctr)) * howManyPixelsInUnit
                
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                ctr += 0.01
            } while(ctr < finalValue)
            NSColor.blue.set()
            currentSegment.stroke()
        }

    }
    
    func performOneOverX(_ x: Double) -> Double {
    
        return 1 / x
    
    }
}
