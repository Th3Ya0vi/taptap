//
//  TapTapViewController.m
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"
#import "GameViewController.h"
#import "HighScoresViewController.h"
#import "SettingsRootController.h"

@implementation MainMenuViewController

@synthesize delegate;

@synthesize gameViewController;
@synthesize highScoresViewController;
@synthesize settingsRootController;

#pragma mark -
#pragma mark Button Navigation Methods

- (IBAction) startButtonPressed {
	
	self.gameViewController = [[GameViewController alloc] initWithNibName: @"GameView" 
																   bundle: nil];
	
	self.gameViewController.delegate = self;
	self.gameViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.gameViewController 
							animated: YES];
}

- (IBAction) highScoresButtonPressed {
	
	self.highScoresViewController = [[HighScoresViewController alloc] initWithNibName: @"HighScoresView" 
																			   bundle: nil];
	self.highScoresViewController.delegate = self;
	self.highScoresViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.highScoresViewController 
							animated: YES];
}

- (IBAction) settingsButtonPressed {
	
	self.settingsRootController = [[SettingsRootController alloc] initWithNibName: @"SettingsRootView" 
																			   bundle: nil];
	self.settingsRootController.delegate = self;
	self.settingsRootController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.settingsRootController 
							animated: YES];
}

#pragma mark -
#pragma mark Lifecycle

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	for (UIView *v in self.view.subviews) {
		if ([v isKindOfClass:[UILabel class]]) {
			UILabel *label = (UILabel*)v;
			[label setFont:[UIFont fontWithName:@"Silom" size:label.font.pointSize]];
		} else if ([v isKindOfClass: [UIButton class]]) {
			UIButton *button = (UIButton *)v;
			[button setFont: [UIFont fontWithName: @"Silom" size: button.font.pointSize]];
		}
	}
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.delegate = nil;
	
	self.highScoresViewController = nil;
	self.gameViewController = nil;
	self.settingsRootController = nil;
}


- (void)dealloc {
	[delegate release];
	
	[highScoresViewController release];
	[gameViewController release];
	[settingsRootController release];
    [super dealloc];
}

@end
