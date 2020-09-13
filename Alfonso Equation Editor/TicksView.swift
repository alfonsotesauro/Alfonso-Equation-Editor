//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class TicksView: AxesView {
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if !appDelegate!.shouldDrawAxes {
            return
        }
        
        let multiplyFactor: Double!
        
        if self.appDelegate.shouldApplyGridSpacing {
            multiplyFactor = Double(Int( self.appDelegate.firstSliderDoubleValue))
        } else {
            multiplyFactor = 1.0
        }
        
        
        let distanceBetweenVerticalLines = self.distanceBetweenVerticalLines * multiplyFactor
        
        if distanceBetweenVerticalLines == 0 {
            print("Eccoci")
        }
        
        // Draw X axis positive Ticks
        
        var ctr: Double = 0.0
        
        var tickHeight = CGFloat(6.0)
        var intCounter: Int = 0
        
        while ctr < Double(halfWidth) {
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 2)
            
            //print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
                
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = CartesianBezierPath(cartesianPlanView: self)
            
            tickBezierPath.move(to: NSPoint(x: CGFloat(ctr * appDelegate.numberOfPixelsInUnit), y: 0 - tickHeight))
            tickBezierPath.line(to: NSPoint(x: CGFloat(ctr * appDelegate.numberOfPixelsInUnit), y: 0 + tickHeight))
            
            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr += 0.5
        }
        
        // Draw X axis negative Ticks
        
        
        ctr = 0.0
        
        tickHeight = CGFloat(6.0)
        intCounter = 0
        
        while ctr > -Double(halfWidth) {
            
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 2)
            
            //  print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = CartesianBezierPath(cartesianPlanView: self)
            
            tickBezierPath.move(to: NSPoint(x: CGFloat(ctr * appDelegate.numberOfPixelsInUnit), y: 0 - tickHeight))
            tickBezierPath.line(to: NSPoint(x: CGFloat(ctr * appDelegate.numberOfPixelsInUnit), y: 0 + tickHeight))
            
            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr -= 0.5
        }
        
        // Draw Y axis positive Ticks
        
        ctr = 0
        
        tickHeight = CGFloat(6.0)
        intCounter = 0
        
        while ctr < Double(halfHeight) {
            
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 2)
            
            //    print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = CartesianBezierPath(cartesianPlanView: self)
            
            tickBezierPath.move(to: NSPoint(x: 0 - tickHeight, y: CGFloat(ctr * appDelegate.numberOfPixelsInUnit)))
            tickBezierPath.line(to: NSPoint(x: 0 + tickHeight, y: CGFloat(ctr * appDelegate.numberOfPixelsInUnit)))
            
            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr += 0.5
        }
        
        // Draw Y axis negative Ticks
        
        ctr = 0
        
        tickHeight = CGFloat(6.0)
        intCounter = 0
        
        while ctr > -Double(halfHeight) {
            
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 2)
            
            //   print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = CartesianBezierPath(cartesianPlanView: self)
            
            tickBezierPath.move(to: NSPoint(x: 0 - tickHeight, y: CGFloat(ctr) * CGFloat(appDelegate.numberOfPixelsInUnit)))
            tickBezierPath.line(to: NSPoint(x: 0 + tickHeight, y: CGFloat(ctr) * CGFloat(appDelegate.numberOfPixelsInUnit)))
            
            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr -= 0.5
        }
    }
}
