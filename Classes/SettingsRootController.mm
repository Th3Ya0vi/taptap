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


#import "SettingsRootController.h"
#import "MainMenuViewController.h"

#import "OpenFeint/OpenFeint.h"

#define kUsernameKey			@"name_preference"
#define kScoresUploadKey		@"scores_preference"
#define kRandomizeKey			@"random_preference"


@implementation SettingsRootController

@synthesize delegate;
@synthesize mainMenuViewController;

@synthesize nameField;
@synthesize submitOnlineCheckLabel;
@synthesize randomizeTimeCheckLabel;

#pragma mark -
#pragma mark NSUserDefaults Methods

- (void) refreshDefaults {
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if (![[defaults objectForKey: kUsernameKey] isEqualToString: @""]) {
		nameField.text = [defaults objectForKey: kUsernameKey];
	}
	
	if ([defaults objectForKey: kScoresUploadKey] == 0) {
		submitOnlineCheckLabel.hidden = YES;
	} else {
		submitOnlineCheckLabel.hidden = NO;
	}
	
	if ([defaults objectForKey: kRandomizeKey] == 0) {
		randomizeTimeCheckLabel.hidden = YES;
	} else {
		randomizeTimeCheckLabel.hidden = NO;
	}

}

- (IBAction) submitOnlineButtonPressed {
	NSLog(@"submitOnlineButtonPressed");
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	if (submitOnlineCheckLabel.hidden == NO) {
		submitOnlineCheckLabel.hidden = YES;
		[defaults setInteger: 0 forKey: kScoresUploadKey];
	} else {
		submitOnlineCheckLabel.hidden = NO;
		[defaults setInteger: 1 forKey: kScoresUploadKey];
	}
}

- (IBAction) randomizeTimeButtonPressed {
	NSLog(@"randomizeTimeButtonPressed");
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	if (randomizeTimeCheckLabel.hidden == NO) {
		randomizeTimeCheckLabel.hidden = YES;
		[defaults setInteger: 0 forKey: kRandomizeKey];
	} else {
		randomizeTimeCheckLabel.hidden = NO;
		[defaults setInteger: 1 forKey: kRandomizeKey];
	}
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	NSLog(@"applicationWillEnterForeground @ settings controller...");
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults synchronize];
	[self refreshDefaults];
}

#pragma mark -
#pragma mark UITextField Methods

- (IBAction) textFieldDoneEditing: (id) sender {
	[sender resignFirstResponder];
}

- (IBAction) textFieldValueChanged: (id) sender {
	NSAssert([sender isKindOfClass: [UITextField class]], @"Sender is not a UITextField.");
	
	UITextField *field = (UITextField *)sender;
	if ([field.text length] > 10) {
		field.text = [field.text substringToIndex: 10];
	}
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject: field.text forKey: kUsernameKey];
}

#pragma mark -
#pragma mark Navigation Button Methods

- (IBAction) mainMenuButtonPressed {
	self.mainMenuViewController = [[MainMenuViewController alloc] initWithNibName: @"MainMenuView" 
																		   bundle: nil];
	self.mainMenuViewController.delegate = self;
	self.mainMenuViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[self presentModalViewController: self.mainMenuViewController 
							animated: YES];
}

- (IBAction) openFeintButtonPressed {
	[OpenFeint launchDashboard];
}


#pragma mark -
#pragma mark Lifecycle Methods

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
	
	[nameField setFont: [UIFont fontWithName: @"Silom" size: nameField.font.pointSize]];
	[nameField center];
	[self refreshDefaults];
	
	UIApplication *app = [UIApplication sharedApplication];
	[[NSNotificationCenter defaultCenter] addObserver: self 
											 selector: @selector(applicationWillEnterForeground:) 
												 name: UIApplicationWillEnterForegroundNotification 
											   object: app];
	
    [super viewDidLoad];
}

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
	
	self.nameField = nil;
	self.submitOnlineCheckLabel = nil;
	self.randomizeTimeCheckLabel = nil;
}


- (void)dealloc {
	[delegate release];
	[mainMenuViewController release];
	
	[nameField release];
	[submitOnlineCheckLabel release];
	[randomizeTimeCheckLabel release];
	
    [super dealloc];
}


@end
