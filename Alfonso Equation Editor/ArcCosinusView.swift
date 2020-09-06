//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class ArcCosinusView: CosinusView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if self.appDelegate!.shouldDrawArcCos {
            var ctr = Double(width / 2) // -10000 is the original
            
            
            
            let currentSegment2 = NSBezierPath.init()
            var firstCorrectY2 = ctr * distanceBetweenVerticalLines
            
            firstCorrectY2 = firstCorrectY2 + Double(height / 2)
            
            currentSegment2.move(to: NSPoint.init(x: ctr, y: firstCorrectY2))
            
            repeat {
                
                var correctX = ctr
                
                correctX = ctr
                
                let toCalc = (ctr - (Double(width / 2)))
                
                var correctY = acos(toCalc / self.steps)
                
                correctY = (correctY * self.steps)
                
                correctY = correctY + Double(height / 2)
                
                
                
                
                currentSegment2.curve(to: NSPoint(x: correctX, y: correctY), controlPoint1: NSPoint(x: correctX, y: correctY), controlPoint2: NSPoint(x: correctX, y: correctY))
                
                
                
                ctr += 5.0
            } while(ctr < Double(width))
            NSColor.red.set()
            currentSegment2.stroke()
            if true {
                
                ctr = 0 // -10000 is the original
                
                
                
                let currentSegment2 = NSBezierPath.init()
                 let toCalc = (ctr - (Double(width / 2)))
                                   
                    var correctY2 = acos(toCalc / self.steps)
                                   
                    correctY2 = (correctY2 * self.steps)
                                   
                correctY2 = correctY2 + Double(height / 2)
                
                currentSegment2.move(to: NSPoint.init(x: ctr, y: firstCorrectY2))
                
                repeat {
                    
                    var correctX = ctr
                    
                    correctX = ctr
                    
                    let toCalc = (ctr - (Double(width / 2)))
                    
                    var correctY = acos(toCalc / self.steps)
                    
                    correctY = (correctY * self.steps)
                    
                    correctY = correctY + Double(height / 2)
                    
                    
                    
                    
                    currentSegment2.curve(to: NSPoint(x: correctX, y: correctY), controlPoint1: NSPoint(x: correctX, y: correctY), controlPoint2: NSPoint(x: correctX, y: correctY))
                    
                    
                    
                    ctr += 5
                } while(ctr < Double(width))
                NSColor.red.set()
                currentSegment2.stroke()
                
            }
        }
        
    }
    
    override func transformXIntoY(_ x: Double) -> Double {
        
        return x ^^ 2
        
    }
    
}


