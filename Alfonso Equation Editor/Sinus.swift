//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class SinusView: ParabolaView {

   override func transformXIntoY(_ x: Double) -> Double {
          
    return x ^^ 2
          
    }
    
    override var isFlipped: Bool {
        return false
    }
    
}
