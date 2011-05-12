//
//  TapTapViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameViewController_iPad;
@class HighScoresViewController_iPad;


@interface MainMenuViewController_iPad : UIViewController {
	id delegate;
	
	UIButton *startButton;
	UIButton *highScoresButton;
	
	GameViewController_iPad *gameViewController;
	HighScoresViewController_iPad *highScoresViewController;
}

@property (nonatomic, assign) id delegate;

@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UIButton *highScoresButton;

@property (nonatomic, retain) HighScoresViewController_iPad *highScoresViewController;
@property (nonatomic, retain) GameViewController_iPad *gameViewController;

- (IBAction) startButtonPressed;
- (IBAction) highScoresButtonPressed;

@end

