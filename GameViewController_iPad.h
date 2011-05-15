//
//  GameViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ResultViewController_iPad;

@interface GameViewController_iPad : UIViewController {
	id delegate;
	ResultViewController_iPad *resultViewController;
	
	UIImageView *tapToWin;
	UIImageView *ready;
	UILabel *instructions;
	UIImageView *totalTaps;
	UIImageView *flashLayer;
	
	NSMutableArray *taps;
	UIImageView *tap;
	
	UILabel *counterLabel;
	int count;
	int tps;	// taps per second
	
	NSTimer *timer;
	int intervalsElapsed;
	int timeLimit;
	BOOL gameOn;
	float touchOffset;
}

@property (nonatomic, retain) IBOutlet UIImageView *tapToWin;
@property (nonatomic, retain) IBOutlet UIImageView *ready;
@property (nonatomic, retain) IBOutlet UILabel *instructions;
@property (nonatomic, retain) IBOutlet UIImageView *totalTaps;
@property (nonatomic, retain) IBOutlet UIImageView *flashLayer;
@property (nonatomic, retain) IBOutlet UILabel *counterLabel;
@property (nonatomic, retain) NSMutableArray *taps;

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) ResultViewController_iPad *resultViewController;

- (void) initializeTimer;
- (void) gameLogic: (NSTimer *) timer;

@end