//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

let shuldDrawExactCenterRect = false

class GeneralEquationView: NumbersView {

    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.

        if shuldDrawExactCenterRect {
        
            var bounds = self.bounds
        
            bounds = bounds.insetBy(dx: 230, dy: 120)
        
            let exactPath = NSBezierPath(rect: bounds)
        
            NSColor.orange.set()
        
            exactPath.stroke()
        }
        
        
        var ctr = -1000.0 // -10000 is the original
              
              var finalValue = fabs(ctr)
              
              
              //let distanceBetweenHorizontalLines = Double(height) / steps
              
              if self.appDelegate!.shouldDrawParabola {
              let currentSegment = NSBezierPath.init()
                currentSegment.lineWidth = 0.5
              var firstCorrectY = self.transformXIntoY(Double(Int(ctr * distanceBetweenVerticalLines)))
        
              firstCorrectY = firstCorrectY + Double(height / 2)
                      
              currentSegment.move(to: NSPoint.init(x: 0, y: firstCorrectY))

              repeat {
                  
                  
                  let correctX = ctr + Double(width / 2)
                  var correctY = ctr + Double(height / 2)
                  
                correctY = self.transformXIntoY(Double(Int(ctr))) / self.steps
              
                  correctY = correctY + Double(height / 2)
                  
               
                  
                  
                 // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
                  currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                 
                  
                  
                ctr += 3.0
              } while(ctr < finalValue)
              NSColor.red.set()
              currentSegment.stroke()
        }
        
        if self.appDelegate!.shouldDrawRetta {
        
        ctr = -appDelegate!.thirdSliderDoubleValue // -10000 is the original
        
        finalValue = fabs(ctr)
        
        let currentSegment2 = NSBezierPath.init()
              var firstCorrectY2 = ctr * distanceBetweenVerticalLines
        
              firstCorrectY2 = firstCorrectY2 + 0 //Double(height / 2)
              
              currentSegment2.move(to: NSPoint.init(x: 0, y: firstCorrectY2))

              repeat {
                  
                  
                  var correctX = (ctr * distanceBetweenVerticalLines) / (self.steps / distanceBetweenVerticalLines)
                  
                  correctX = correctX + Double(width / 2)
                  
                var correctY = (ctr * distanceBetweenVerticalLines) / (self.steps / distanceBetweenVerticalLines)
              
                  correctY = correctY + Double(height / 2)
                  
               
                  
                  
                 // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
                  currentSegment2.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                 
                
                  
                ctr += 3.0
              } while(ctr < finalValue)
              NSColor.blue.set()
              currentSegment2.stroke()
        }
        
        if self.appDelegate!.shouldDrawAbsoluteValue {
              
              ctr = -appDelegate!.thirdSliderDoubleValue // -10000 is the original
                     
                     finalValue = fabs(ctr)
                     
                     let currentSegment2 = NSBezierPath.init()
                           var firstCorrectY2 = ctr * distanceBetweenVerticalLines
                     
                           firstCorrectY2 = firstCorrectY2 + Double(height / 2)
                           
                           currentSegment2.move(to: NSPoint.init(x: ctr, y: firstCorrectY2))

                           repeat {
                               
                               
                               var correctX = (ctr * distanceBetweenVerticalLines) / (self.steps / distanceBetweenVerticalLines)
                               
                               correctX = correctX + Double(width / 2)
                               
                             var correctY = (ctr * distanceBetweenVerticalLines) / (self.steps / distanceBetweenVerticalLines)
                           
                               correctY = correctY + Double(height / 2)
                               
                            let halfPlanHeight = Double(height / 2)
                            
                            if correctX < Double(width / 2) {
                                let difference = halfPlanHeight - correctY
                                correctY = halfPlanHeight + difference
                            }
                            
                        
                                 currentSegment2.curve(to: NSPoint(x: correctX, y: correctY), controlPoint1: NSPoint(x: correctX, y: correctY), controlPoint2: NSPoint(x: correctX, y: correctY))
                                
                           
                               
                            ctr += 1.0
                    } while(ctr < finalValue)
                    NSColor.orange.set()
                    currentSegment2.stroke()
              }
        
       
        
    }
    
    func transformXIntoY(_ x: Double) -> Double {
           
        return x * 2

    }
}
