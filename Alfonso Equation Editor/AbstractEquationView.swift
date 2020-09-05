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

    override func awakeFromNib() {
        super.awakeFromNib()

        appDelegate = NSApp.delegate as? AppDelegate
    }

}
