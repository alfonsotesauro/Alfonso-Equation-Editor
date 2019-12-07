//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class CartesianView: NSView {

    weak var appDelegate: AppDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.appDelegate = NSApp!.delegate as! AppDelegate
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        print("Eccoci dirtyRect = \(NSStringFromRect(dirtyRect))")
        
        // Drawing code here.
        let color = NSColor.init(red: 0.0, green: 0.0, blue: 200, alpha: 1.0)
        color.set()
                
        var count = appDelegate?.firstSliderDoubleValue
        
        var ctr = 1.0
        
        let contourPath = NSBezierPath.init(rect: self.bounds)
        
        contourPath.stroke()
        
        let path = NSBezierPath.init()
                
        let height = self.frame.size.height
        let width = self.frame.size.width
        
        let distanceBetweenHorizontalLines = Double(height) / count!
        let distanceBetweenVerticalLines = Double(width) / count!

        repeat {
            path.move(to: NSPoint.init(x: CGFloat(distanceBetweenVerticalLines * ctr) + width / 2, y: 0))
            path.line(to: NSPoint.init(x: CGFloat(distanceBetweenVerticalLines * ctr) + width / 2, y: height))
            path.move(to: NSPoint.init(x: width / 2 - CGFloat(distanceBetweenVerticalLines * ctr), y: 0))
            path.line(to: NSPoint.init(x: width / 2 - CGFloat(distanceBetweenVerticalLines * ctr), y: height))
          //  path.move(to: NSPoint.init(x: distanceBetweenVerticalLines * ctr, y: 0))
          //  path.line(to: NSPoint.init(x: CGFloat(distanceBetweenVerticalLines * ctr), y: height))
            path.lineWidth = 0.5
            if appDelegate!.shouldUseSquareGrid {
            path.move(to: NSPoint.init(x: 0, y: (CGFloat((distanceBetweenVerticalLines * ctr)) + height / 2)))
        path.line(to: NSPoint.init(x: width, y: (CGFloat((distanceBetweenVerticalLines * ctr)) + height / 2)))
            
        path.move(to: NSPoint.init(x: 0, y: height / 2 - CGFloat(distanceBetweenVerticalLines * ctr)))
        path.line(to: NSPoint.init(x: width, y: height / 2 - CGFloat(distanceBetweenVerticalLines * ctr)))
            } else {
                path.move(to: NSPoint.init(x: 0, y: (CGFloat((distanceBetweenHorizontalLines * ctr)) + height / 2)))
                      path.line(to: NSPoint.init(x: width, y: (CGFloat((distanceBetweenHorizontalLines * ctr)) + height / 2)))
                          
                      path.move(to: NSPoint.init(x: 0, y: height / 2 - CGFloat(distanceBetweenHorizontalLines * ctr)))
                      path.line(to: NSPoint.init(x: width, y: height / 2 - CGFloat(distanceBetweenHorizontalLines * ctr)))
            }
        //    path.lineWidth = 0.5
            
            ctr += 1
        } while(ctr < count!)
        
        path.stroke()
        
        let axesPath = NSBezierPath.init()
        
        axesPath.move(to: NSPoint.init(x: width / 2, y: 0))
        axesPath.line(to: NSPoint.init(x: width / 2, y: height))
        axesPath.line(to: NSPoint.init(x: width / 2 - 6, y: height-10))
        axesPath.move(to: NSPoint.init(x: width / 2, y: height))
        axesPath.line(to: NSPoint.init(x: width / 2 + 6, y: height-10))

        
        
        axesPath.move(to: NSPoint.init(x: 0, y: height / 2))
        axesPath.line(to: NSPoint.init(x: width, y: height / 2))
        axesPath.line(to: NSPoint.init(x: width - 10, y: height / 2 + 6))
        axesPath.move(to: NSPoint.init(x: width, y: height / 2))
        axesPath.line(to: NSPoint.init(x: width - 10, y: height / 2 - 6))

        
        
        NSColor.yellow.set()
        axesPath.stroke()
        
        
    }
   
}
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
