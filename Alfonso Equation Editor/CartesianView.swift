//
//  CartesianView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 06/12/2019.
//  Copyright © 2019 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class CartesianView: NSView {
    weak var appDelegate: AppDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        appDelegate = NSApp!.delegate as! AppDelegate
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let backgroundRect = NSBezierPath(rect: bounds)

        NSColor.white.set()

        backgroundRect.fill()

        //print("Eccoci dirtyRect = \(NSStringFromRect(dirtyRect))")

        // Drawing code here.
        let color = NSColor.black
        color.set()

        var count = appDelegate?.firstSliderDoubleValue

        var ctr = 1.0

        let contourPath = NSBezierPath(rect: bounds)

        contourPath.stroke()

        let height = frame.size.height
        let width = frame.size.width

        let distanceBetweenHorizontalLines = Double(height) / count!
        let distanceBetweenVerticalLines = Double(width) / count!

        var verticalLines: [NSBezierPath] = [NSBezierPath]()

        repeat {
            let path = NSBezierPath()

            path.move(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr) + width / 2, y: 0))
            path.line(to: NSPoint(x: CGFloat(distanceBetweenVerticalLines * ctr) + width / 2, y: height))
            path.move(to: NSPoint(x: width / 2 - CGFloat(distanceBetweenVerticalLines * ctr), y: 0))
            path.line(to: NSPoint(x: width / 2 - CGFloat(distanceBetweenVerticalLines * ctr), y: height))

            path.lineWidth = 0.5

            if appDelegate!.shouldUseSquareGrid {
                path.move(to: NSPoint(x: 0, y: CGFloat(distanceBetweenVerticalLines * ctr) + height / 2))
                path.line(to: NSPoint(x: width, y: CGFloat(distanceBetweenVerticalLines * ctr) + height / 2))

                path.move(to: NSPoint(x: 0, y: height / 2 - CGFloat(distanceBetweenVerticalLines * ctr)))
                path.line(to: NSPoint(x: width, y: height / 2 - CGFloat(distanceBetweenVerticalLines * ctr)))
            } else {
                path.move(to: NSPoint(x: 0, y: CGFloat(distanceBetweenHorizontalLines * ctr) + height / 2))
                path.line(to: NSPoint(x: width, y: CGFloat(distanceBetweenHorizontalLines * ctr) + height / 2))

                path.move(to: NSPoint(x: 0, y: height / 2 - CGFloat(distanceBetweenHorizontalLines * ctr)))
                path.line(to: NSPoint(x: width, y: height / 2 - CGFloat(distanceBetweenHorizontalLines * ctr)))
            }
            //    path.lineWidth = 0.5
            verticalLines.append(path)
            ctr += 1
        } while ctr < count!

        for (index, item) in verticalLines.enumerated() {
            if index % 6 == 0, index != 0 {
                NSColor.black.set()
            } else {
                NSColor.lightGray.set()
            }

            item.stroke()
        }
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^: PowerPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
