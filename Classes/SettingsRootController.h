//
//  SettingsRootController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface SettingsRootController : UIViewController {
	id delegate;
	MainMenuViewController *mainMenuViewController;
	
	UITextField *nameField;
	UILabel *submitOnlineCheckLabel;
	UILabel *randomizeTimeCheckLabel;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) MainMenuViewController *mainMenuViewController;

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UILabel *submitOnlineCheckLabel;
@property (nonatomic, retain) IBOutlet UILabel *randomizeTimeCheckLabel;

- (IBAction) mainMenuButtonPressed;

- (IBAction) textFieldDoneEditing: (id) sender;
- (IBAction) textFieldValueChanged: (id) sender;
- (void) refreshDefaults;

- (IBAction) submitOnlineButtonPressed;
- (IBAction) randomizeTimeButtonPressed;

@end
