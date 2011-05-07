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

@implementation MainMenuViewController

@synthesize delegate;

@synthesize startButton;
@synthesize highScoresButton;

@synthesize gameViewController;
@synthesize highScoresViewController;

#pragma mark -
#pragma mark Custom Methods



- (IBAction) startButtonPressed {
	NSLog(@"Start button pressed.");
	self.gameViewController = [[GameViewController alloc] initWithNibName: @"GameView" 
																   bundle: nil];
	
	self.gameViewController.delegate = self;
	self.gameViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.gameViewController 
							animated: YES];
}

- (IBAction) highScoresButtonPressed {
	NSLog(@"High scores button pressed.");
	
	self.highScoresViewController = [[HighScoresViewController alloc] initWithNibName: @"HighScoresView" 
																			   bundle: nil];
	self.highScoresViewController.delegate = self;
	self.highScoresViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.highScoresViewController 
							animated: YES];
}


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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
	self.startButton = nil;
	self.highScoresButton = nil;
	
	self.highScoresViewController = nil;
}


- (void)dealloc {
	[startButton release];
	[highScoresButton release];
	
	[highScoresViewController release];
    [super dealloc];
}

@end
