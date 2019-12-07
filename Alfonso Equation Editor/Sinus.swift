//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class SinusView: GeneralEquationView {

   override func transformXIntoY(_ x: Double) -> Double {
          
          return sin(x)
          
    }
    
}
