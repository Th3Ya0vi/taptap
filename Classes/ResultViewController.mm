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


#import "ResultViewController.h"
#import "MainMenuViewController.h"
#import "GameViewController.h"

#import "OpenFeint/OFAchievement.h"
#import "OpenFeint/OFHighScoreService.h"

#define kOFAchievementNoTapsID		@"963342"
#define kOFLeaderboardiPhoneTPSID	@"741497"


@implementation ResultViewController

@synthesize delegate;
@synthesize mainMenuViewController;
@synthesize gameViewController;

@synthesize tapsPerSecondLabel;
@synthesize tps;
@synthesize totalTapsLabel;
@synthesize totalTaps;
@synthesize timeElapsedLabel;
@synthesize seconds;
@synthesize rank;

#pragma mark -
#pragma mark OpenFeint Methods

- (void) evaluateOFAchievements {
	if (totalTaps == 0) {
		[[OFAchievement achievement: kOFAchievementNoTapsID] updateProgressionComplete: 100.0f andShowNotification: YES];
	}
}

- (void) postToOFLeaderboards {
	[OFHighScoreService	setHighScore: tps 
					  forLeaderboard: kOFLeaderboardiPhoneTPSID
						   onSuccess: OFDelegate()
						   onFailure: OFDelegate()];
}

- (IBAction) playAgainButtonPressed {
	self.gameViewController = [[GameViewController alloc] initWithNibName: @"GameView" 
																   bundle: nil];
	self.gameViewController.delegate = self;
	self.gameViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.gameViewController 
							animated: YES];
}

- (IBAction) mainMenuButtonPressed {
	self.mainMenuViewController = [[MainMenuViewController alloc] initWithNibName: @"MainMenuView" 
																		   bundle: nil];
	self.mainMenuViewController.delegate = self;
	self.mainMenuViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.mainMenuViewController 
							animated: YES];
}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	for (UIView *v in self.view.subviews) {
		if ([v isKindOfClass:[UILabel class]]) {
			UILabel *label = (UILabel*)v;
			[label setFont:[UIFont fontWithName:@"Silom" size:label.font.pointSize]];
		} else if ([v isKindOfClass: [UIButton class]]) {
			UIButton *button = (UIButton *)v;
			[button setFont: [UIFont fontWithName: @"Silom" size: button.font.pointSize]];
		}
	}
	
	[self evaluateOFAchievements];
	[self postToOFLeaderboards];
	
	tapsPerSecondLabel.text = [NSString stringWithFormat:@"%d", tps];
	totalTapsLabel.text = [NSString stringWithFormat: @"%d", totalTaps];
	timeElapsedLabel.text = [NSString stringWithFormat: @"0:%02d", seconds];
	
	if (tps > 15) {
		rank.text = @"HOT TAPAS";
	} else if (tps > 10) {
		rank.text = @"TAP WATER";
	} else if (tps > 0) {
		rank.text = @"COLD TAPIOCA";
	} else {
		rank.text = @"TOTAL LOSER";
	}
	
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
	self.delegate = nil;
	self.mainMenuViewController = nil;
	self.gameViewController = nil;
	
	self.tapsPerSecondLabel = nil;
	self.totalTapsLabel = nil;
	self.timeElapsedLabel = nil;
	self.rank = nil;
}


- (void)dealloc {
	[delegate release];
	[mainMenuViewController release];
	[gameViewController release];
	
	[tapsPerSecondLabel release];
	[totalTapsLabel release];
	[timeElapsedLabel release];
	[rank release];
    [super dealloc];
}

@end
