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


@interface MainMenuViewController : UIViewController {
	id delegate;
	
	UIButton *startButton;
	UIButton *highScoresButton;
	
	GameViewController *gameViewController;
	HighScoresViewController *highScoresViewController;
}

@property (nonatomic, assign) id delegate;

@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UIButton *highScoresButton;

@property (nonatomic, retain) HighScoresViewController *highScoresViewController;
@property (nonatomic, retain) GameViewController *gameViewController;

- (IBAction) startButtonPressed;
- (IBAction) highScoresButtonPressed;

@end

