//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa


class CrossView: AbsoluteValueView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
        
var ctr: Double = Double(-self.maximumCoordinate)
        let finalValue = fabs(ctr)
    
        if self.appDelegate!.shouldDrawCross {
            let currentSegment = CartesianBezierPath(cartesianPlanView: self)
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
            let howManyPixelsInUnit = appDelegate.numberOfPixelsInUnit
            
            let firstCorrectY = self.performYEqualX(Double(ctr)) * howManyPixelsInUnit
            
            
            currentSegment.move(to: NSPoint.init(x: ctr * howManyPixelsInUnit, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr * howManyPixelsInUnit
                var correctY = ctr
                
                correctY = self.performYEqualX(Double(ctr)) * howManyPixelsInUnit
                
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                ctr += 0.01
            } while(ctr < finalValue)
            NSColor.red.set()
            currentSegment.stroke()
        }
        if self.appDelegate!.shouldDrawCross {
            ctr = -5.0
            let currentSegment = CartesianBezierPath(cartesianPlanView: self)
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
            let howManyPixelsInUnit = appDelegate.numberOfPixelsInUnit
            
            let firstCorrectY = self.performYEqualMinusX(Double(ctr)) * howManyPixelsInUnit
            
            
            currentSegment.move(to: NSPoint.init(x: ctr * howManyPixelsInUnit, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr * howManyPixelsInUnit
                
                
                let correctY = self.performYEqualMinusX(Double(ctr)) * howManyPixelsInUnit
                
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                ctr += 0.01
            } while(ctr < finalValue)
            NSColor.red.set()
            currentSegment.stroke()
        }
    }
    
    func performYEqualX(_ x: Double) -> Double {
        
        return x
        
    }
    
    func performYEqualMinusX(_ x: Double) -> Double {
    
        return -x
    
    }
}
