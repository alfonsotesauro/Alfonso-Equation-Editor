//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class NumbersView: TicksView {
   

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let height = frame.size.height
        let width = frame.size.width
        
        guard let count = (appDelegate?.firstSliderDoubleValue) else {
            fatalError()
        }
        
        let distanceBetweenHorizontalLines = height / CGFloat(count)
        let distanceBetweenVerticalLines = width / CGFloat(count)
        
       
        // Draw X axis positive Ticks
        
        var ctr = width / 2
        
        var tickHeight = CGFloat(6.0)
        var intCounter: Int = 0
        
        while ctr < width {
            
            ctr += distanceBetweenVerticalLines
            
            
            let (quotient, reminder) =  intCounter.quotientAndRemainder(dividingBy: 6)
                
            print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                tickHeight = 8.0
            } else {
                tickHeight = 4.5
            }
            
            intCounter += 1
            let tickPoint = NSPoint(x: ctr + 5, y: height / 2 - 20)
            
            let nsString = "\(intCounter)" as NSString
            
            nsString.draw(at: tickPoint, withAttributes: nil)
            
        }
        
      
    }
}
