//
//  SettingsRootController.m
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsRootController.h"
#import "MainMenuViewController.h"

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


#pragma mark -
#pragma mark Lifecycle Methods

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
