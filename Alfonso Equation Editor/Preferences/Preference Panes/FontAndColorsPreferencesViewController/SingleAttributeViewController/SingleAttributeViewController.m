//
//  SingleAttributeViewController.m
//  Literal Creator for Xcode
//
//  Created by Alfonso Maria Tesauro on 18/08/2020.
//  Copyright © 2020 Alfonso Maria Tesauro. All rights reserved.
//

#import "SingleAttributeViewController.h"

static void *kAttributeColorObservationContext = &kAttributeColorObservationContext;
static void *kCurrentFontStyleObservationContext = &kCurrentFontStyleObservationContext;

@interface SingleAttributeViewController ()

@end

@implementation SingleAttributeViewController

- (instancetype)init {
    
    self = [super initWithNibName:[self className] bundle:[NSBundle mainBundle]];
    
    if (self) {
        self.currentFontStyleIndex = 0;
    }
    
    return self;
    
}

- (NSInteger)styleIndex {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
    NSString *defaultKey = [@"kDefaultStyleFor" stringByAppendingString:self.attributeName];
    
    return [defaults integerForKey:defaultKey];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self addObserver:self forKeyPath:@"attributeColor" options:NSKeyValueObservingOptionNew context:kAttributeColorObservationContext];
    [self addObserver:self forKeyPath:@"currentFontStyleIndex" options:NSKeyValueObservingOptionNew context:kCurrentFontStyleObservationContext];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                   
       NSString *defaultKey = [@"kDefaultStyleFor" stringByAppendingString:self.attributeName];
       
    self.currentFontStyleIndex = [defaults integerForKey:defaultKey];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (context == kAttributeColorObservationContext) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString *defaultKey = [@"kDefaultColorFor" stringByAppendingString:self.attributeName];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.attributeColor];
        
        [defaults setValue:data forKey:defaultKey];
        
    } else if (context == kCurrentFontStyleObservationContext) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
              
        NSString *defaultKey = [@"kDefaultStyleFor" stringByAppendingString:self.attributeName];
              
        [defaults setValue:[NSNumber numberWithInteger:self.currentFontStyleIndex] forKey:defaultKey];
        
    } else
   
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

- (IBAction)userDidSelectColorWell:(NSColorWell *)sender {
   // NSBeep();
}

-(void) dealloc {
    
    [self removeObserver:self forKeyPath:@"attributeColor" context:kAttributeColorObservationContext];
    
}

@end
