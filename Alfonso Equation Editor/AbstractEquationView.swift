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
    var steps = 170.0 {
        didSet(newValue) {
           setUpUI()
        }
    }
    var distanceBetweenVerticalLines: Double!
    var distanceBetweenHorizontalLines: Double!
    var halfWidth: CGFloat!
    var halfHeight: CGFloat!

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        setUpUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        appDelegate = NSApp.delegate as? AppDelegate
        
        setUpUI()
        
        let cursorTrackingArea = NSTrackingArea(rect: self.bounds, options: [NSTrackingArea.Options.activeAlways,NSTrackingArea.Options.cursorUpdate], owner: self, userInfo: nil)
        
        self.addTrackingArea(cursorTrackingArea)
        
        NotificationCenter.default.addObserver(forName: NSView.boundsDidChangeNotification, object: self, queue: nil) { (note) in
            
            print("Coordinate: \(self.bounds)")
        }
        
        self.postsBoundsChangedNotifications = true

    }
    
    fileprivate func setUpUI() {
        
        //steps = appDelegate.numberOfSteps
        
        height = self.bounds.size.height
        width = self.bounds.size.width
        
        halfWidth = width / 2
        halfHeight = height / 2
        
        distanceBetweenVerticalLines = Double(Double(width) / steps)
        distanceBetweenHorizontalLines = Double(Double(height) / steps)
        
        let userInfo: [AnyHashable : Any] = ["verticalDistance":distanceBetweenVerticalLines, "horizontalDistance" : distanceBetweenHorizontalLines]
        
        NotificationCenter.default.post(name: NSNotification.Name("distancesChanged"), object: nil, userInfo: userInfo)
        
        
        if self.appDelegate.shouldApplyGridSpacing {
            multiplyFactor =  self.appDelegate.firstSliderDoubleValue
        } else {
            multiplyFactor = 1.0
        }
    }
    

}
