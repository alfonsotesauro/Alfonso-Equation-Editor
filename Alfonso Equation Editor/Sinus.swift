//
//  ParabolaView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class SinusView: TangentView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let viewToObserve = self.enclosingScrollView
        
        let pippo = NotificationCenter.default.addObserver(forName: NSScrollView.didLiveScrollNotification, object: viewToObserve, queue: nil) { (note: Notification) in
            
            //print("Current scroll = \(viewToObserve?.verticalScroller?.doubleValue)")
            //print("Current clip = \(viewToObserve?.contentView.frame)")
            //print("Current docView = \(viewToObserve?.documentView?.frame)")

        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
           // self.enclosingScrollView?.verticalScroller?.doubleValue = 0.5
        }
    }
    
    @objc func viewDidScroll() {
        
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        setUpUI()
        // Drawing code here.
        
        var ctr: Double = Double(-self.maximumCoordinate)
        
        let finalValue = fabs(ctr)
        

        if self.appDelegate!.shouldDrawSin {
            let currentSegment = CartesianBezierPath(cartesianPlanView: self)
            currentSegment.lineWidth = CGFloat(self.appDelegate.fourthSliderDoubleValue)
            
            let howManyPixelsInUnit = appDelegate.numberOfPixelsInUnit
            
            let firstCorrectY = self.performSinus(Double(ctr)) * howManyPixelsInUnit
            
            
            currentSegment.move(to: NSPoint.init(x: ctr * howManyPixelsInUnit, y: firstCorrectY))
            
            repeat {
                
                
                let correctX = ctr * howManyPixelsInUnit
                var correctY = ctr
                
                correctY = self.performSinus(Double(ctr)) * howManyPixelsInUnit
                                    
                currentSegment.curve(to: NSPoint.init(x: correctX, y: correctY), controlPoint1: NSPoint.init(x: correctX, y: correctY), controlPoint2: NSPoint.init(x: correctX, y: correctY))
                
                ctr += 0.01
            } while(ctr < finalValue)
            NSColor.red.set()
            currentSegment.stroke()
        }
        
    }

    func performSinus(_ x: Double) -> Double {
        
        return sin(x)
        
    }

    override func cursorUpdate(with event: NSEvent) {
        
        let segControl = self.appDelegate.toolsSegmentedControl
        
        if segControl?.selectedSegment == 0 {
            NSCursor.arrow.set()
        }
        if segControl?.selectedSegment == 1 {
        
            let image = NSImage(named: "Move")!
            
            NSCursor(image: image, hotSpot: NSPoint(x: image.size.width / 2,y: image.size.height / 2)).set()
        
        }
        if segControl?.selectedSegment == 2 {
        
            let image = NSImage(named: "Zoom")!
                       
            NSCursor(image: image, hotSpot: NSPoint(x: image.size.width / 2,y: image.size.height / 2)).set()
        }
    }
    
}
