
#import "GeneralPreferencesViewController.h"

@implementation GeneralPreferencesViewController

- (id)init
{
    return [super initWithNibName:@"GeneralPreferencesView" bundle:nil];
}

#pragma mark - MASPreferencesViewController

- (NSString *)viewIdentifier
{
    return @"GeneralPreferences";
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:NSImageNamePreferencesGeneral];
}

- (NSString *)toolbarItemLabel
{
    return NSLocalizedString(@"General", @"Toolbar item name for the General preference pane");
}
- (IBAction)userDidSelectRadioButtons:(NSButton *)senderButton {
    
}
- (IBAction)userDidSelectRadioButtons2:(NSButton *)senderButton {
    
}
- (IBAction)userDidSelectRadioButtons3:(NSButton *)senderButton {
    
}

- (IBAction)userDidSelectResetPreferences:(NSButton *)senderButton {
    NSString *strIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:strIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setValue:@YES forKey:@"alreadyAskedToContactServer"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"USERDEFAULTS_HAVE_BEEN_RESET" object:nil];
}

- (void)viewDidAppear {
    [super viewDidAppear];
    // Do view setup here.
    self.view.window.maxSize = self.view.window.contentView.frame.size;
}

@end
