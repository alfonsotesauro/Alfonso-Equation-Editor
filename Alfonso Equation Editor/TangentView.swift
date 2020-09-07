//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class TangentView: ArcCosinusView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if self.appDelegate!.shouldDrawTan {
            var ctr = Double(width / 2) // -10000 is the original
            
            
            
            
           
                
                ctr = 0 // -10000 is the original
                
                
                
                let currentSegment2 = NSBezierPath.init()
                var firstCorrectY2 = ctr * distanceBetweenVerticalLines
                
                firstCorrectY2 = firstCorrectY2 + Double(height / 2)
                
                currentSegment2.move(to: NSPoint.init(x: ctr, y: firstCorrectY2))
                
                repeat {
                    
                    var correctX = ctr
                    
                    correctX = ctr
                    
                    let toCalc = (ctr - (Double(width / 2)))
                    
                    let valueToComputeTangentWith = toCalc / self.steps
                    
                   
                    
                    var correctY = tan(toCalc / self.steps)
                    
                    correctY = correctY * self.steps
                    
                    correctY = correctY + Double(height / 2)
                    
                    
                    
                                            
                                        
                    
                    currentSegment2.curve(to: NSPoint(x: correctX, y: correctY), controlPoint1: NSPoint(x: correctX, y: correctY), controlPoint2: NSPoint(x: correctX, y: correctY))
                    
                    
                    
                    ctr += 5.0
                } while(ctr < Double(width))
                NSColor.red.set()
                currentSegment2.stroke()
                
            }
        
        
    }
    
    
}
