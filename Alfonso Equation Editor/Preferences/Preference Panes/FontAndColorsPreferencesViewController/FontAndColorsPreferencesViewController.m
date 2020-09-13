
#import "FontAndColorsPreferencesViewController.h"

@implementation FontAndColorsPreferencesViewController

- (id)init
{
    self = [super initWithNibName:@"FontsAndColorsPreferencesView" bundle:nil];
    if (self ) {
        self.allAttributesViewControllers = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - MASPreferencesViewController

- (NSString *)viewIdentifier
{
    return @"FontsAndColorsPreferences";
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:NSImageNameColorPanel];
}

- (NSString *)toolbarItemLabel
{
    return NSLocalizedString(@"Colors", @"Toolbar item name for the Fonts And Colors preference pane");
}

- (void)setUpUI {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //[defaults removeObjectForKey:@"kDefaultColorForText"];
    
    
    
    NSArray *names = @[@"Grid bold", @"Grid light", @"Axes", @"numbersAndLetters", @"Retta"];
    NSArray *colors = @[[NSColor whiteColor],[NSColor colorWithCalibratedHue:0.995 saturation:1.000 brightness:0.832 alpha:1.000],[NSColor colorWithCalibratedHue:0.312 saturation:0.986 brightness:0.499 alpha:1.000], [NSColor orangeColor], [NSColor colorWithCalibratedHue:0.312 saturation:0.986 brightness:0.499 alpha:1.000]];
    
    for (long ctr=0;ctr<5;ctr++) {
        
        SingleAttributeViewController *newVc = [[SingleAttributeViewController alloc] init];
        newVc.attributeName = names[ctr];
        newVc.attributeColor = colors[ctr];
        [self.allAttributesStackView addArrangedSubview:newVc.view];
        [self.allAttributesViewControllers addObject:newVc];
        
        NSString *defaultKey = [@"kDefaultColorFor" stringByAppendingString:newVc.attributeName];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:newVc.attributeColor];
        
        [defaults setValue:data forKey:defaultKey];
    }
    
    NSArray *names2 = @[@"Parabola", @"x^2", @"x^3", @"x^4"];
    NSArray *colors2 = @[[NSColor colorWithCalibratedHue:0.312 saturation:0.986 brightness:0.499 alpha:1.000],[NSColor whiteColor],[NSColor whiteColor],[NSColor blackColor]];
    
    for (long ctr=0;ctr<4;ctr++) {
        
        SingleAttributeViewController *newVc = [[SingleAttributeViewController alloc] init];
        newVc.attributeName = names2[ctr];
        newVc.attributeColor = colors2[ctr];
        [self.allAttributesStackView2 addArrangedSubview:newVc.view];
        [self.allAttributesViewControllers addObject:newVc];
        
        NSString *defaultKey = [@"kDefaultColorFor" stringByAppendingString:newVc.attributeName];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:newVc.attributeColor];
        
        [defaults setValue:data forKey:defaultKey];
    }
    NSArray *names3 = @[@"Sin", @"Cos", @"abs", @"cross"];
    NSArray *colors3 = @[[NSColor colorWithCalibratedHue:0.312 saturation:0.986 brightness:0.499 alpha:1.000],[NSColor whiteColor],[NSColor whiteColor],[NSColor blackColor]];
    
    for (long ctr=0;ctr<4;ctr++) {
        
        SingleAttributeViewController *newVc = [[SingleAttributeViewController alloc] init];
        newVc.attributeName = names3[ctr];
        newVc.attributeColor = colors3[ctr];
        [self.allAttributesStackView2 addArrangedSubview:newVc.view];
        [self.allAttributesViewControllers addObject:newVc];
        
        NSString *defaultKey = [@"kDefaultColorFor" stringByAppendingString:newVc.attributeName];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:newVc.attributeColor];
        
        [defaults setValue:data forKey:defaultKey];
    }
}

- (void)viewDidLoad {
    
    [self setUpUI];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidSelectResetColorsButton:) name:@"USERDEFAULTS_HAVE_BEEN_RESET" object:nil];
    
}
- (IBAction)userDidSelectRadioButtons:(NSButton *)senderButton {
    
}
- (IBAction)userDidSelectResetColorsButton:(NSButton *)senderButton {
    
    for (NSViewController *vc in self.allAttributesViewControllers) {
        
        NSStackView *sv = (NSStackView *)[vc.view superview];
        
        [sv removeArrangedSubview:vc.view];
        
        [vc.view removeFromSuperview];
        
    }
    
    [self.allAttributesViewControllers removeAllObjects];
    
   [self setUpUI];
}


-(NSColor *)randomColor {
   
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    NSColor *color = [NSColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}

- (void)viewDidAppear {
    [super viewDidAppear];
    // Do view setup here.
    self.view.window.maxSize = self.view.window.contentView.frame.size;
}

- (IBAction)userDidSelectChooseFontButton:(id)sender {
    
    NSFontPanel *panel = [NSFontPanel sharedFontPanel];
    
    [panel makeKeyAndOrderFront:self];
    
    
}

@end
