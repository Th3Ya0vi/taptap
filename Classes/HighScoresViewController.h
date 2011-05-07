//
//  HighScoresViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface HighScoresViewController : UIViewController {
	id delegate;
	
	UIButton *backButton;
	MainMenuViewController *mainMenuViewController;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) MainMenuViewController *mainMenuViewController;

- (IBAction) backButtonPressed;

@end
