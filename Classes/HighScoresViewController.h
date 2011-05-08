//
//  HighScoresViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;
@class TapTapAppDelegate;

@interface HighScoresViewController : UIViewController {
	id delegate;
	
	UIButton *backButton;
	MainMenuViewController *mainMenuViewController;
	TapTapAppDelegate *tapTapAppDelegate;
	
	// obviously, there's a better way to do this, i'm sure
	UILabel *player_name_1;
	UILabel *score_1;	
	UILabel *player_name_2;
	UILabel *score_2;	
	UILabel *player_name_3;
	UILabel *score_3;	
	UILabel *player_name_4;
	UILabel *score_4;	
	UILabel *player_name_5;
	UILabel *score_5;	
	UILabel *player_name_6;
	UILabel *score_6;	
	UILabel *player_name_7;
	UILabel *score_7;	
	UILabel *player_name_8;
	UILabel *score_8;	
	UILabel *player_name_9;
	UILabel *score_9;	
	UILabel *player_name_10;
	UILabel *score_10;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) MainMenuViewController *mainMenuViewController;
@property (nonatomic, retain) TapTapAppDelegate *tapTapAppDelegate;

@property (nonatomic, retain) IBOutlet UILabel *player_name_1;
@property (nonatomic, retain) IBOutlet UILabel *score_1;
@property (nonatomic, retain) IBOutlet UILabel *player_name_2;
@property (nonatomic, retain) IBOutlet UILabel *score_2;
@property (nonatomic, retain) IBOutlet UILabel *player_name_3;
@property (nonatomic, retain) IBOutlet UILabel *score_3;
@property (nonatomic, retain) IBOutlet UILabel *player_name_4;
@property (nonatomic, retain) IBOutlet UILabel *score_4;
@property (nonatomic, retain) IBOutlet UILabel *player_name_5;
@property (nonatomic, retain) IBOutlet UILabel *score_5;
@property (nonatomic, retain) IBOutlet UILabel *player_name_6;
@property (nonatomic, retain) IBOutlet UILabel *score_6;
@property (nonatomic, retain) IBOutlet UILabel *player_name_7;
@property (nonatomic, retain) IBOutlet UILabel *score_7;
@property (nonatomic, retain) IBOutlet UILabel *player_name_8;
@property (nonatomic, retain) IBOutlet UILabel *score_8;
@property (nonatomic, retain) IBOutlet UILabel *player_name_9;
@property (nonatomic, retain) IBOutlet UILabel *score_9;
@property (nonatomic, retain) IBOutlet UILabel *player_name_10;
@property (nonatomic, retain) IBOutlet UILabel *score_10;

- (IBAction) backButtonPressed;

@end
