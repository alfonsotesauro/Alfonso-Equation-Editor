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
    var multiplyFactor: Double = 1.0
    var height: CGFloat!
    var width: CGFloat!
    var steps = 19.0 {
        didSet(newValue) {
           setUpUI()
        }
    }
    var distanceBetweenVerticalLines: Double!
    var distanceBetweenHorizontalLines: Double!
    

   
    
    override func awakeFromNib() {
        super.awakeFromNib()

        appDelegate = NSApp.delegate as? AppDelegate
        
        //steps = appDelegate
        
        steps = appDelegate.numberOfSteps
        
        setUpUI()
        
        let cursorTrackingArea = NSTrackingArea(rect: self.bounds, options: [NSTrackingArea.Options.activeAlways,NSTrackingArea.Options.cursorUpdate], owner: self, userInfo: nil)
        
        self.addTrackingArea(cursorTrackingArea)

    }
    
   
    
    fileprivate func setUpUI() {
        height = self.bounds.size.height
        width = self.bounds.size.width
        distanceBetweenVerticalLines = Double(Double(width) / steps)
        distanceBetweenHorizontalLines = Double(Double(height) / steps)
        
        if self.appDelegate.shouldApplyGridSpacing {
            multiplyFactor =  self.appDelegate.firstSliderDoubleValue
        } else {
            multiplyFactor = 1.0
        }
    }
    

}
