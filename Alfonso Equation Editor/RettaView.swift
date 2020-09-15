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
        
var ctr: Double = Double(-self.maximumCoordinate)
        let finalValue = fabs(ctr)
        
        if self.appDelegate!.shouldDrawRetta {
        
        let rettaBezierPath = CartesianBezierPath(cartesianPlanView: self)
        rettaBezierPath.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
        let firstCorrectY2 = ctr * appDelegate.numberOfPixelsInUnit
                
        rettaBezierPath.move(to: NSPoint.init(x: -Double(halfHeight), y: firstCorrectY2))
        
        repeat {
            
            
            let correctX = ctr * appDelegate.numberOfPixelsInUnit
            
            let correctY = (ctr * appDelegate.numberOfPixelsInUnit)
            
             rettaBezierPath.line(to: NSPoint.init(x: correctX, y: correctY))
            
            
            
            
            ctr += 0.01
        } while(ctr < finalValue)
        NSColor.blue.set()
        rettaBezierPath.stroke()
    }
        
     
        
        
        
    }
   
    
}
