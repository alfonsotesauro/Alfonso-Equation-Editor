//
//  SearchFieldEnabledValueTransformer.m
//  Brian Cliette Uber Course
//
//  Created by Alfonso Maria Tesauro on 03/04/16.
//  Copyright © 2016 Alfonso Maria Tesauro. All rights reserved.
//

#import "SearchFieldEnabledValueTransformer.h"

@implementation SearchFieldEnabledValueTransformer

+ (Class)transformedValueClass {
    return [NSColor class];
}

+ (BOOL)allowsReverseTransformation {
    return NO;
}

- (id)transformedValue:(id)value {
    
    if (value == nil) return nil;
    
    if (![value isKindOfClass:[NSNumber class]]) return nil;
    
    if ([value boolValue]) {
        return [NSColor grayColor];
    }
    
    return [NSColor whiteColor];
}

@end
