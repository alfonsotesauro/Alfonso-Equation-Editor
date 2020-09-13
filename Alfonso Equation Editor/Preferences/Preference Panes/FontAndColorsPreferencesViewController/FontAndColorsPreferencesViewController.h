//
// This is a sample General preference pane
//

#import "MASPreferences.h"
#import "SingleAttributeViewController.h"

@interface FontAndColorsPreferencesViewController : NSViewController <MASPreferencesViewController>

@property (strong) NSMutableArray<SingleAttributeViewController *> *allAttributesViewControllers;
@property (assign) IBOutlet NSStackView *allAttributesStackView;
@property (assign) IBOutlet NSStackView *allAttributesStackView2;
@property (assign) IBOutlet NSStackView *allAttributesStackView3;

@property (assign) IBOutlet NSTextField *themeNameTextField;
@property (assign) IBOutlet NSPopUpButton *themesPopupButton;
@property (assign) IBOutlet NSTextField *fontNameTextField;
@property (assign) IBOutlet NSButton *antiAliasFontCheckBox;



@end
