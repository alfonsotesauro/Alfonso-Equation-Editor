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
        
        
        if !appDelegate.shouldDrawNumbers {
            return
        }
        
        // Draw the Zero
        
        let zeroPoint = NSPoint(x: Double(width / 2) - 15, y: Double(height / 2 - 20))
        let nsZeroString = "0" as NSString
        nsZeroString.draw(at: zeroPoint, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 15)!])
        
        // Draw the small x
        
        let xPoint = NSPoint(x: Double(width / 2) + 160, y: Double(height / 2 - 40))
        let nsXString = "x" as NSString
        nsXString.draw(at: xPoint, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 15)!])
        
        // Draw the small y
        
        let yPoint = NSPoint(x: Double(width / 2) - 40, y: Double(height / 2 + 100))
        let nsYString = "y" as NSString
        nsYString.draw(at: yPoint, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 15)!])
        
        
        
        // Draw X axis positive Numbers
        
        var ctr: Double = Double(width / 2)
        var numberToBeDrawn = 0.5
        var intCounter: Int = 0
        
        while ctr < Double(width) {
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
            
            //print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                let halfHeight: Double = Double(height / 2)
                
                var numberRect = NSRect(x: ctr - 9.35,y: halfHeight - 30, width:18.7, height: 20)
                let numberString = "\(numberToBeDrawn)"
                var nsNumberString = numberString as NSString
                if numberString.last == "0" {
                    nsNumberString = numberString.dropLast().dropLast() as NSString
                    numberRect = NSRect(x: ctr - 3.5,y: halfHeight - 30, width:7, height: 20)
                }
                nsNumberString.draw(in: numberRect, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 13)!])
                
                numberToBeDrawn += 0.5
            }
            
            intCounter += 1
            
            ctr += distanceBetweenVerticalLines * 3.0
        }
        
        // Draw X axis negative Numbers
               
               ctr = Double(width / 2)
               numberToBeDrawn = -0.5
               intCounter = 0
               
               while ctr > 0 {
                   
                   let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                   
                   //print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
                   
                   if reminder == 0 && intCounter != 0 {
                       let halfHeight: Double = Double(height / 2)
                       
                    var numberRect = NSRect(x: ctr - 12.75,y: halfHeight - 30, width:25.5, height: 20)
                       let numberString = "\(numberToBeDrawn)"
                       var nsNumberString = numberString as NSString
                       if numberString.last == "0" {
                           nsNumberString = numberString.dropLast().dropLast() as NSString
                        numberRect = NSRect(x: ctr - 7.1,y: halfHeight - 30, width:14.2, height: 20)
                       }
                       nsNumberString.draw(in: numberRect, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 13)!])
                       
                       numberToBeDrawn -= 0.5
                   }
                   
                   intCounter += 1
                   
                   ctr -= distanceBetweenVerticalLines * 3.0
               }
        
        // Draw Y axis positive Numbers
                      
                      ctr = Double(height / 2)
                      numberToBeDrawn = 0.5
                      intCounter = 0
                      
                      while ctr < Double(height) {
                          
                          let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                          
                          //print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
                          
                          if reminder == 0 && intCounter != 0 {
                              let halfWidth: Double = Double(width / 2)
                              
                           var numberRect = NSRect(x: halfWidth - 25,y: ctr - 16, width:25.5, height: 20)
                              let numberString = "\(numberToBeDrawn)"
                              var nsNumberString = numberString as NSString
                              if numberString.last == "0" {
                                  nsNumberString = numberString.dropLast().dropLast() as NSString
                               numberRect = NSRect(x: halfWidth - 14,y: ctr - 16, width:14.2, height: 20)
                              }
                              nsNumberString.draw(in: numberRect, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 13)!])
                              
                              numberToBeDrawn += 0.5
                          }
                          
                          intCounter += 1
                          
                          ctr += distanceBetweenVerticalLines * 3.0
                      }
        
        // Draw Y axis negative Numbers
        
        ctr = Double(height / 2)
        numberToBeDrawn = -0.5
        intCounter = 0
        
        while ctr > 0 {
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
            
            //print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            if reminder == 0 && intCounter != 0 {
                let halfWidth: Double = Double(width / 2)
                
             var numberRect = NSRect(x: halfWidth - 25,y: ctr - 16, width:25.5, height: 20)
                let numberString = "\(numberToBeDrawn)"
                var nsNumberString = numberString as NSString
                if numberString.last == "0" {
                    nsNumberString = numberString.dropLast().dropLast() as NSString
                 numberRect = NSRect(x: halfWidth - 14,y: ctr - 16, width:14.2, height: 20)
                }
                nsNumberString.draw(in: numberRect, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 13)!])
                
                numberToBeDrawn -= 0.5
            }
            
            intCounter += 1
            
            ctr -= distanceBetweenVerticalLines * 3.0
        }
    }
}

