//
//  ResultViewController.m
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultViewController.h"
#import "MainMenuViewController.h"
#import "GameViewController.h"


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
		}
	}
	
	tapsPerSecondLabel.text = [NSString stringWithFormat:@"%d", tps];
	totalTapsLabel.text = [NSString stringWithFormat: @"%d", totalTaps];
	timeElapsedLabel.text = [NSString stringWithFormat: @"0:%02d", seconds];
	
	if (tps > 15) {
		rank.image = [UIImage imageNamed: @"hot_tapas.png"];
	} else if (tps > 10) {
		rank.image = [UIImage imageNamed: @"tap_water.png"];
	} else if (tps > 0) {
		rank.image = [UIImage imageNamed: @"cold_tapioca.png"];
	} else {
		rank.image = [UIImage imageNamed: @"total_loser.png"];
	}
	[rank sizeToFit];
	
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
