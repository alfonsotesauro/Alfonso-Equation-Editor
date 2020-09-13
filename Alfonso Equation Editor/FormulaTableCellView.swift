//
//  FormulaTableCellView.swift
//  Alfonso Equation Editor
//
//  Created by Alfonso Maria Tesauro on 13/09/2020.
//  Copyright © 2020 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class FormulaTableCellView: NSTableCellView {

    @IBOutlet weak var enabledCheckbox: NSButton!
    @IBOutlet weak var formulaView: MTMathUILabel!

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    
    }
    
}
