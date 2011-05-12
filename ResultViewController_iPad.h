//
//  ResultViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController_iPad;
@class GameViewController_iPad;

@interface ResultViewController_iPad : UIViewController {
	id delegate;
	
	MainMenuViewController_iPad *mainMenuViewController;
	GameViewController_iPad *gameViewController;
	
	UILabel *tapsPerSecondLabel;
	int tps;

	UILabel *totalTapsLabel;
	int totalTaps;
	
	UILabel *timeElapsedLabel;
	int seconds;
	
	UILabel *rank;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) MainMenuViewController_iPad *mainMenuViewController;
@property (nonatomic, retain) GameViewController_iPad *gameViewController;

@property (nonatomic, retain) IBOutlet UILabel *tapsPerSecondLabel;
@property int tps;
@property (nonatomic, retain) IBOutlet UILabel *totalTapsLabel;
@property int totalTaps;
@property (nonatomic, retain) IBOutlet UILabel *timeElapsedLabel;
@property int seconds;
@property (nonatomic, retain) IBOutlet UILabel *rank;

- (IBAction) playAgainButtonPressed;
- (IBAction) mainMenuButtonPressed;

@end
