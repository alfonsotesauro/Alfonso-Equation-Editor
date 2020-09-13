//
//  SingleAttributeViewController.h
//  Literal Creator for Xcode
//
//  Created by Alfonso Maria Tesauro on 18/08/2020.
//  Copyright © 2020 Alfonso Maria Tesauro. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleAttributeViewController : NSViewController

@property (strong)  NSString    *attributeName;
@property (strong)  NSColor    *attributeColor;
@property (strong)  NSString    *selectedFontStyle;
@property (assign)  IBOutlet NSColorWell    *attributeColorWell;
@property (assign)  NSInteger    currentFontStyleIndex;

@end

NS_ASSUME_NONNULL_END
