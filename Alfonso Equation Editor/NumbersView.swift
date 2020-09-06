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
        
        guard let count = (appDelegate?.firstSliderDoubleValue) else {
            fatalError()
        }
        
        print("\(NSFontManager.shared.availableFontFamilies.description)")
        
        // Draw the Zero
        
        let zeroPoint = NSPoint(x: Double(width / 2) - 15, y: Double(height / 2 - 20))
        let nsZeroString = "0" as NSString
        nsZeroString.draw(at: zeroPoint, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 15)!])

         // Draw the small x
        
        let xPoint = NSPoint(x: Double(width / 2) + 100, y: Double(height / 2 - 20))
        let nsXString = "x" as NSString
        nsXString.draw(at: xPoint, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 15)!])

        // Draw the small y
             
        let yPoint = NSPoint(x: Double(width / 2) - 15, y: Double(height / 2 + 100))
        let nsYString = "y" as NSString
        nsYString.draw(at: yPoint, withAttributes: [NSAttributedString.Key.font : NSFont(name: "Folio Std", size: 15)!])

        
        var ctr: Double = Double(width / 2)
        
        var intCounter: Int = 0
        
        while ctr < Double(width) {
            
            
            
            let (_, reminder) =  intCounter.quotientAndRemainder(dividingBy: 5)
                
          //  print("Orig - \(intCounter) - Quotient - \(quotient) - Remainder \(reminder)")
            
            
            
            intCounter += 1
            let tickPoint = NSPoint(x: ctr + 5, y: Double(height / 2 - 20))
            
            let nsString = "\(intCounter)" as NSString
            
           // nsString.draw(at: tickPoint, withAttributes: nil)
            
            ctr += distanceBetweenVerticalLines

        }
        
      
    }
}
