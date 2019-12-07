//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class ParabolaView: GeneralEquationView {

   override func transformXIntoY(_ x: Double) -> Double {
            
            return x ^^ 2
            
    }
    
}

struct CartesianCoordinates {
    
    var x: CGFloat
    var y: CGFloat
    
    init(cocoaCoordinatesPoint: NSPoint, inView: NSView) {
        let viewFrame = inView.frame
        
        self.x = cocoaCoordinatesPoint.x + viewFrame.size.width / 2
        self.y = cocoaCoordinatesPoint.y + viewFrame.size.height / 2
        
    }
    
    
    
}

