//
//  Copyright (c) 2012 modocache
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import <UIKit/UIKit.h>

@class MainMenuViewController_iPad;
@class TapTapAppDelegate_iPad;

@interface HighScoresViewController_iPad : UIViewController {
	id delegate;
	
	UIButton *backButton;
	MainMenuViewController_iPad *mainMenuViewController;
	TapTapAppDelegate_iPad *tapTapAppDelegate;
	
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
@property (nonatomic, retain) MainMenuViewController_iPad *mainMenuViewController;
@property (nonatomic, retain) TapTapAppDelegate_iPad *tapTapAppDelegate;

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
