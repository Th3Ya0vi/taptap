//
//  TapTapViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameViewController;
@class HighScoresViewController;
@class SettingsRootController;


@interface MainMenuViewController : UIViewController {
	id delegate;
	
	GameViewController *gameViewController;
	HighScoresViewController *highScoresViewController;
	SettingsRootController *settingsRootController;
}

@property (nonatomic, assign) id delegate;

@property (nonatomic, retain) HighScoresViewController *highScoresViewController;
@property (nonatomic, retain) GameViewController *gameViewController;
@property (nonatomic, retain) SettingsRootController *settingsRootController;

- (IBAction) startButtonPressed;
- (IBAction) highScoresButtonPressed;
- (IBAction) settingsButtonPressed;

@end

