//
//  ResultViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;
@class GameViewController;

@interface ResultViewController : UIViewController {
	id delegate;
	
	MainMenuViewController *mainMenuViewController;
	GameViewController *gameViewController;
	
	UILabel *tapsPerSecondLabel;
	int tps;

	UILabel *totalTapsLabel;
	int totalTaps;
	
	UILabel *timeElapsedLabel;
	int seconds;
	
	UIImageView *rank;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) MainMenuViewController *mainMenuViewController;
@property (nonatomic, retain) GameViewController *gameViewController;

@property (nonatomic, retain) IBOutlet UILabel *tapsPerSecondLabel;
@property int tps;
@property (nonatomic, retain) IBOutlet UILabel *totalTapsLabel;
@property int totalTaps;
@property (nonatomic, retain) IBOutlet UILabel *timeElapsedLabel;
@property int seconds;
@property (nonatomic, retain) IBOutlet UIImageView *rank;

- (IBAction) playAgainButtonPressed;
- (IBAction) mainMenuButtonPressed;

@end
