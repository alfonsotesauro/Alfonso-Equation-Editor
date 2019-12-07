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
          
    return Double(self.factorial(of: Int(x)))
          
    }
    
    func factorial(of x: Int) -> Int {
        
        
        if x == 0 {
            return 1;
        }
        
        return x * self.factorial(of: x-1)
        
    }
    
}
