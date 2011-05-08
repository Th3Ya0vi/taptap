//
//  HighScoresViewController.m
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TapTapAppDelegate.h"
#import "HighScoresViewController.h"
#import "MainMenuViewController.h"

@implementation HighScoresViewController

@synthesize delegate;
@synthesize backButton;
@synthesize mainMenuViewController;

@synthesize player_name_1;
@synthesize score_1;
@synthesize player_name_2;
@synthesize score_2;
@synthesize player_name_3;
@synthesize score_3;
@synthesize player_name_4;
@synthesize score_4;
@synthesize player_name_5;
@synthesize score_5;
@synthesize player_name_6;
@synthesize score_6;
@synthesize player_name_7;
@synthesize score_7;
@synthesize player_name_8;
@synthesize score_8;
@synthesize player_name_9;
@synthesize score_9;
@synthesize player_name_10;
@synthesize score_10;

#pragma mark -
#pragma mark Custom Methods

- (IBAction) backButtonPressed {
	NSLog(@"Back button pressed.");
	
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

- (void) viewDidAppear:(BOOL)animated {
		TapTapAppDelegate *tapTapAppDelegate = (TapTapAppDelegate *) [[UIApplication sharedApplication] delegate];
	[tapTapAppDelegate getHighScores];
	NSLog(@"%@", tapTapAppDelegate.highScores);
	
	int rank = 0;
	for (id highScore in tapTapAppDelegate.highScores) {
		rank++;
		NSLog(@"%@, %d", highScore, rank);
		switch (rank) {
			case 1:
				player_name_1.text = [highScore objectForKey: @"player_name"];
				score_1.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 2:
				player_name_2.text = [highScore objectForKey: @"player_name"];
				score_2.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 3:
				player_name_3.text = [highScore objectForKey: @"player_name"];
				score_3.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 4:
				player_name_4.text = [highScore objectForKey: @"player_name"];
				score_4.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 5:
				player_name_5.text = [highScore objectForKey: @"player_name"];
				score_5.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 6:
				player_name_6.text = [highScore objectForKey: @"player_name"];
				score_6.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 7:
				player_name_7.text = [highScore objectForKey: @"player_name"];
				score_7.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 8:
				player_name_8.text = [highScore objectForKey: @"player_name"];
				score_8.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 9:
				player_name_9.text = [highScore objectForKey: @"player_name"];
				score_9.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 10:
				player_name_10.text = [highScore objectForKey: @"player_name"];
				score_10.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			default:
				break;
		}
	}
	
	[super viewDidAppear: YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	for (UIView *v in self.view.subviews) {
		if ([v isKindOfClass:[UILabel class]]) {
			UILabel *label = (UILabel*)v;
			[label setFont:[UIFont fontWithName:@"Silom" size:label.font.pointSize]];
		}
	}
	
	TapTapAppDelegate *tapTapAppDelegate = (TapTapAppDelegate *) [[UIApplication sharedApplication] delegate];
	[tapTapAppDelegate getHighScores];
	NSLog(@"%@", tapTapAppDelegate.highScores);
	
	int rank = 0;
	for (id highScore in tapTapAppDelegate.highScores) {
		rank++;
		NSLog(@"%@, %d", highScore, rank);
		switch (rank) {
			case 1:
				player_name_1.text = [highScore objectForKey: @"player_name"];
				score_1.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 2:
				player_name_2.text = [highScore objectForKey: @"player_name"];
				score_2.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 3:
				player_name_3.text = [highScore objectForKey: @"player_name"];
				score_3.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 4:
				player_name_4.text = [highScore objectForKey: @"player_name"];
				score_4.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 5:
				player_name_5.text = [highScore objectForKey: @"player_name"];
				score_5.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 6:
				player_name_6.text = [highScore objectForKey: @"player_name"];
				score_6.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 7:
				player_name_7.text = [highScore objectForKey: @"player_name"];
				score_7.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 8:
				player_name_8.text = [highScore objectForKey: @"player_name"];
				score_8.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 9:
				player_name_9.text = [highScore objectForKey: @"player_name"];
				score_9.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			case 10:
				player_name_10.text = [highScore objectForKey: @"player_name"];
				score_10.text = [NSString stringWithFormat: @"%@ TPS", [highScore objectForKey: @"score"]];
				break;
			default:
				break;
		}
	}

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
	
	self.backButton = nil;
	self.mainMenuViewController = nil;
	self.player_name_1 = nil;
	self.score_1 = nil;
	self.player_name_2 = nil;
	self.score_2 = nil;
	self.player_name_3 = nil;
	self.score_3 = nil;
	self.player_name_4 = nil;
	self.score_4 = nil;
	self.player_name_5 = nil;
	self.score_5 = nil;
	self.player_name_6 = nil;
	self.score_6 = nil;
	self.player_name_7 = nil;
	self.score_7 = nil;
	self.player_name_8 = nil;
	self.score_8 = nil;
	self.player_name_9 = nil;
	self.score_9 = nil;
	self.player_name_10 = nil;
	self.score_10 = nil;
}


- (void)dealloc {
	[backButton release];
	[mainMenuViewController release];
	[player_name_1 release];
	[score_1 release];
	[player_name_2 release];
	[score_2 release];
	[player_name_3 release];
	[score_3 release];
	[player_name_4 release];
	[score_4 release];
	[player_name_5 release];
	[score_5 release];
	[player_name_6 release];
	[score_6 release];
	[player_name_7 release];
	[score_7 release];
	[player_name_8 release];
	[score_8 release];
	[player_name_9 release];
	[score_9 release];
	[player_name_10 release];
	[score_10 release];
    [super dealloc];
}


@end
