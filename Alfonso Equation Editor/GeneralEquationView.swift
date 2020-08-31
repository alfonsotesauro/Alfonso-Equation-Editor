//
//  GeneralEquationView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 07/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class GeneralEquationView: NumbersView {

    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        let steps = appDelegate?.secondSliderDoubleValue // 1000 is the original
                  
        var ctr = -appDelegate!.thirdSliderDoubleValue // -10000 is the original
              
              var finalValue = fabs(ctr)
              
              let height = self.frame.size.height
              let width = self.frame.size.width
              
              //let distanceBetweenHorizontalLines = Double(height) / steps
              let distanceBetweenVerticalLines = Double(width) / steps!
              
              let currentSegment = NSBezierPath.init()
              var firstCorrectY = self.transformXIntoY(Double(Int(ctr * distanceBetweenVerticalLines)))
        
              firstCorrectY = firstCorrectY + Double(height / 2)
                      
              currentSegment.move(to: NSPoint.init(x: 0, y: firstCorrectY))

              repeat {
                  
                  
                  var correctX = ctr * distanceBetweenVerticalLines
                  
                  correctX = correctX + Double(width / 2)
                  
                var correctY = self.transformXIntoY(Double(Int((ctr / appDelegate!.fourthSliderDoubleValue) * distanceBetweenVerticalLines))) * self.appDelegate!.fifthSliderDoubleValue
              
                  correctY = correctY + Double(height / 2)
                  
               
                  
                  
                 // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
                  currentSegment.curve(to: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint1: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint2: NSPoint.init(x: correctX + 3.0, y: correctY))
                 
                  
                  
              ctr += 1
              } while(ctr < finalValue)
              NSColor.red.set()
              currentSegment.stroke()
        
        ctr = -appDelegate!.thirdSliderDoubleValue // -10000 is the original
        
        finalValue = fabs(ctr)
        
        let currentSegment2 = NSBezierPath.init()
              var firstCorrectY2 = ctr * distanceBetweenVerticalLines
        
              firstCorrectY2 = firstCorrectY2 + Double(height / 2)
              
              currentSegment2.move(to: NSPoint.init(x: 0, y: firstCorrectY2))

              repeat {
                  
                  
                  var correctX = ctr * distanceBetweenVerticalLines
                  
                  correctX = correctX + Double(width / 2)
                  
                var correctY = ctr / appDelegate!.fourthSliderDoubleValue * distanceBetweenVerticalLines * self.appDelegate!.fifthSliderDoubleValue
              
                  correctY = correctY + Double(height / 2)
                  
               
                  
                  
                 // currentSegment.line(to: NSPoint.init(x: Int(correctX + 3.0), y: correctY))
                  currentSegment2.curve(to: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint1: NSPoint.init(x: correctX + 3.0, y: correctY), controlPoint2: NSPoint.init(x: correctX + 3.0, y: correctY))
                 
                  
                  
              ctr += 1
              } while(ctr < finalValue)
              NSColor.blue.set()
              currentSegment2.stroke()
        
        
    }
    
    func transformXIntoY(_ x: Double) -> Double {
           
        return x * 2

    }
}
