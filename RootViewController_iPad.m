//
//  RootViewController.m
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController_iPad.h"
#import "MainMenuViewController_iPad.h"
#import "GameViewController_iPad.h"


@implementation RootViewController_iPad

@synthesize mainMenuViewController;


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
	MainMenuViewController_iPad *mMViewController = [[MainMenuViewController_iPad alloc] initWithNibName: @"MainMenuView_iPad" 
																							  bundle: nil];
	self.mainMenuViewController = mMViewController;
	[self.view insertSubview: mMViewController.view 
					 atIndex: 0];
	[mMViewController release];
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
	
	self.mainMenuViewController = nil;
}


- (void)dealloc {
	[mainMenuViewController release];
    [super dealloc];
}


@end
