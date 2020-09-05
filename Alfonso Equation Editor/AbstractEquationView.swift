//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class AbstractEquationView: NSView {
    
    weak var appDelegate: AppDelegate!
    
    var height: CGFloat!
    var width: CGFloat!
    var steps = 38.0
    var distanceBetweenVerticalLines: Double!
    var distanceBetweenHorizontalLines: Double!
    

    override func awakeFromNib() {
        super.awakeFromNib()

        appDelegate = NSApp.delegate as? AppDelegate
        height = self.bounds.size.height
        width = self.bounds.size.width
        distanceBetweenVerticalLines = Double(width) / steps
        distanceBetweenHorizontalLines = Double(height) / steps

    }

}
