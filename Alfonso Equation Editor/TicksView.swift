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
        
        // Draw X axis positive Ticks
        
        var ctr: Double = Double(width / 2)
        
        var tickHeight = CGFloat(6.0)
        var intCounter: Int = 0
        
        while ctr < Double(width) {
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                
            //print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
                
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = NSBezierPath()
            
            tickBezierPath.move(to: NSPoint(x: CGFloat(ctr), y: height / 2 - tickHeight))
            tickBezierPath.line(to: NSPoint(x: CGFloat(ctr), y: height / 2 + tickHeight))

            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr += distanceBetweenVerticalLines * 3.0
        }
        
        // Draw X axis negative Ticks

        
        ctr = Double(width / 2)
        
        tickHeight = CGFloat(6.0)
        intCounter = 0
        
        while ctr > 0 {
            
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                
          //  print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = NSBezierPath()
            
            tickBezierPath.move(to: NSPoint(x: CGFloat(ctr), y: height / 2 - tickHeight))
            tickBezierPath.line(to: NSPoint(x: CGFloat(ctr), y: height / 2 + tickHeight))

            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr -= distanceBetweenVerticalLines * 3
        }
        
        // Draw Y axis positive Ticks
        
        ctr = Double(height / 2)
        
        tickHeight = CGFloat(6.0)
        intCounter = 0
        
        while ctr < Double(height) {
            
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                
        //    print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = NSBezierPath()
            
            tickBezierPath.move(to: NSPoint(x: width / 2 - tickHeight, y: CGFloat(ctr)))
            tickBezierPath.line(to: NSPoint(x: width / 2 + tickHeight, y: CGFloat(ctr)))

            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr += distanceBetweenVerticalLines * 3
        }
        
        // Draw Y axis negative Ticks

        ctr = Double(height / 2)
        
        tickHeight = CGFloat(6.0)
        intCounter = 0
        
        while ctr > 0 {
            
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                
         //   print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 5.0
            } else {
                tickHeight = 2.0
            }
            
            intCounter += 1
            let tickBezierPath = NSBezierPath()
            
            tickBezierPath.move(to: NSPoint(x: width / 2 - tickHeight, y: CGFloat(ctr)))
            tickBezierPath.line(to: NSPoint(x: width / 2 + tickHeight, y: CGFloat(ctr)))

            tickBezierPath.lineWidth = 2.0
            
            NSColor.black.set()
            
            tickBezierPath.stroke()
            
            ctr -= distanceBetweenVerticalLines * 3
        }
    }
}
