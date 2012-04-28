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
