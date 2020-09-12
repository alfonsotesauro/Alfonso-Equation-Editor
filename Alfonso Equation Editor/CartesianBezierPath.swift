//
//  CartesianBezierPath.swift
//  Translated Equation Editor
//
//  Created by Alfonso Maria Tesauro on 12/09/2020.
//  Copyright © 2020 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class CartesianBezierPath: NSBezierPath {

    var cartesianPlanView: NSView!
    
    
    init(cartesianPlanView: NSView) {
        super.init()
        self.cartesianPlanView = cartesianPlanView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func move(to point: NSPoint) {
           guard let cartesianPlanView = cartesianPlanView else {
               fatalError("The cartesianPlanView has to be set before using the CartesianBeziePath overridden methods.")
           }
        super.move(to: NSPoint(x: point.x + cartesianPlanView.bounds.size.width / 2, y: point.y + cartesianPlanView.bounds.size.height / 2))
    }
       
    override func curve(to endPoint: NSPoint, controlPoint1: NSPoint, controlPoint2: NSPoint) {
           guard let cartesianPlanView = cartesianPlanView else {
               fatalError("The cartesianPlanView has to be set before using the CartesianBeziePath overridden methods.")
           }
           var truePoint = endPoint
           var trueControlPoint = controlPoint1
           var trueControlPoint2 = controlPoint2
           
           truePoint.x += cartesianPlanView.bounds.size.width / 2
           truePoint.y += cartesianPlanView.bounds.size.height / 2
           
           trueControlPoint.x += cartesianPlanView.bounds.size.width / 2
           trueControlPoint.y += cartesianPlanView.bounds.size.height / 2
           
           trueControlPoint2.x += cartesianPlanView.bounds.size.width / 2
           trueControlPoint2.y += cartesianPlanView.bounds.size.height / 2
           
           super.curve(to: truePoint, controlPoint1: trueControlPoint, controlPoint2: trueControlPoint2)
       }
       
    override func line(to point: NSPoint) {
           
        guard let cartesianPlanView = cartesianPlanView else {
            fatalError("The cartesianPlanView has to be set before using the CartesianBeziePath overridden methods.")
        }
        
           var truePoint = point
          
           truePoint.x += cartesianPlanView.bounds.size.width / 2
           truePoint.y += cartesianPlanView.bounds.size.height / 2
           
           super.line(to: truePoint)
       }
    
    func move(to point: NSPoint, inView: NSView) {
        
        super.move(to: NSPoint(x: point.x + inView.bounds.size.width / 2, y: point.y + inView.bounds.size.height / 2))
    }
    
    func curve(to endPoint: NSPoint, controlPoint1: NSPoint, controlPoint2: NSPoint, inView: NSView) {
        
        var truePoint = endPoint
        var trueControlPoint = controlPoint1
        var trueControlPoint2 = controlPoint2
        
        truePoint.x += inView.bounds.size.width / 2
        truePoint.y += inView.bounds.size.height / 2
        
        trueControlPoint.x += inView.bounds.size.width / 2
        trueControlPoint.y += inView.bounds.size.height / 2
        
        trueControlPoint2.x += inView.bounds.size.width / 2
        trueControlPoint2.y += inView.bounds.size.height / 2
        
        super.curve(to: truePoint, controlPoint1: trueControlPoint, controlPoint2: trueControlPoint2)
    }
    
    func line(to point: NSPoint, inView: NSView) {
        
        var truePoint = point
       
        truePoint.x += inView.bounds.size.width / 2
        truePoint.y += inView.bounds.size.height / 2
        
        super.line(to: truePoint)
    }
}
