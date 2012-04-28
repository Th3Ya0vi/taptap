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


#import "MainMenuViewController_iPad.h"
#import "GameViewController_iPad.h"
#import "HighScoresViewController_iPad.h"

@implementation MainMenuViewController_iPad

@synthesize delegate;

@synthesize startButton;
@synthesize highScoresButton;

@synthesize gameViewController;
@synthesize highScoresViewController;

#pragma mark -
#pragma mark Custom Methods



- (IBAction) startButtonPressed {
	NSLog(@"Start button pressed.");
	self.gameViewController = [[GameViewController_iPad alloc] initWithNibName: @"GameView_iPad" 
																		bundle: nil];
	
	self.gameViewController.delegate = self;
	self.gameViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.gameViewController 
							animated: YES];
}

- (IBAction) highScoresButtonPressed {
	NSLog(@"High scores button pressed.");
	
	self.highScoresViewController = [[HighScoresViewController_iPad alloc] initWithNibName: @"HighScoresView_iPad" 
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



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	for (UIView *v in self.view.subviews) {
		if ([v isKindOfClass:[UILabel class]]) {
		  UILabel *label = (UILabel*)v;

		  [label setFont:[UIFont fontWithName:@"Silom" size:label.font.pointSize]];
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
	self.startButton = nil;
	self.highScoresButton = nil;
	
	self.highScoresViewController = nil;
	self.gameViewController = nil;
}


- (void)dealloc {
	[delegate release];
	[startButton release];
	[highScoresButton release];
	
	[highScoresViewController release];
	[gameViewController release];
    [super dealloc];
}

@end
