//
//  SearchFieldEnabledValueTransformer.swift
//  Brian Cliette Uber Course
//
//  Created by Alfonso Maria Tesauro on 03/04/16.
//  Copyright © 2016 Alfonso Maria Tesauro. All rights reserved.
//

import Cocoa

class SearchFieldEnabledValueTransformer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return NSColor.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let value = value else { return nil }
        
        guard let number = value as? NSNumber else { return nil }
        
        if number.boolValue {
            return NSColor.gray
        }
        
        return NSColor.white
    }
}
