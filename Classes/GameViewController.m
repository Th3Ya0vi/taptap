//
//  GameViewController.m
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "ResultViewController.h"

#define HIGH_SCORES_URL			@"http://modocache.webfactional.com/apps/taptap/leaderboard.xml"
#define kUsernameKey			@"name_preference"
#define kScoresUploadKey		@"scores_preference"

@implementation GameViewController

@synthesize delegate;
@synthesize resultViewController;

@synthesize tapToWin;
@synthesize ready;
@synthesize instructions;
@synthesize totalTaps;
@synthesize flashLayer;
@synthesize taps;
@synthesize counterLabel;



#pragma mark -
#pragma mark High Score Methods

- (void) submitHighScoreWithUsername: (NSString *) username {
	NSLog(@"Submitting high score...");
	
	NSString *urlString = HIGH_SCORES_URL;
	NSURL *url = [NSURL URLWithString: urlString];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url]; // it is mutable, since we edit to http method etc below
	[request setHTTPMethod: @"POST"];
	[request setValue: @"text/xml" forHTTPHeaderField: @"Content-Type"];
	
	NSMutableData *highScoreData = [NSMutableData data];
	[highScoreData appendData: [[NSString stringWithFormat: @"player_name=%@;", username] dataUsingEncoding: NSUTF8StringEncoding]];
	[highScoreData appendData: [[NSString stringWithFormat: @"score=%d", tps] dataUsingEncoding: NSUTF8StringEncoding]];
	[request setHTTPBody: highScoreData];
	NSLog(@"%@", highScoreData);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request 
																  delegate: self];
	if (!connection) {
		NSLog(@"Request to send high scores appears to be invalid.");
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
	}
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not Connected to the Internet" 
													message: @"Your score could not be posted to the online leaderboards." 
												   delegate: self 
										  cancelButtonTitle: @"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
	NSInteger statusCode = [httpResponse statusCode];
	if (statusCode == 404 || statusCode == 500) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Server Error" 
															message: @"Your score could not be posted to the online leaderboards dur to a server error. We aplogize for the inconvenience." 
														   delegate: self 
												  cancelButtonTitle: @"OK" 
												  otherButtonTitles: nil];
		[alert show];
		[alert release];
	} else if (statusCode == 403) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Invalid Username" 
														message: @"Your score could not be posted to the online leaderboards due to an invalid username." 
													   delegate: self 
											  cancelButtonTitle: @"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
	} else if ( statusCode == 200 ) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
	}
}


#pragma mark -
#pragma mark Touch Methods

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (gameOn) {
		// UITouch *touch = [[event allTouches] anyObject];
		count += [[event allTouches] count];
		
		for (UITouch *touch in [event allTouches]) {
			UIImage *image = [UIImage imageNamed: @"tap.png"];
			UIImage *highlighted = [UIImage imageNamed: @"tap_highlighted.png"];
			tap = [[[UIImageView alloc] initWithImage: image
									 highlightedImage: highlighted] autorelease];
			CGRect newFrame = tap.frame;
			newFrame.origin = CGPointMake([touch locationInView: touch.view].x - 70, [touch locationInView: touch.view].y - 40);
			tap.frame = newFrame;
			[self.view addSubview: tap];

			[taps addObject: tap];
			[self performSelector: @selector(removeImage:) 
				   withObject: [taps lastObject] 
				   afterDelay: 0.1];
		}

	}
}


- (void) removeImage: (UIImageView *) target {
	// target.highlighted = YES;
	target.alpha -= 0.1;
}


#pragma mark -
#pragma mark Custom Methods

- (void) toggleDisplay: (UIImageView *) target {
	target.hidden = !target.hidden;
}

- (void) toggleLabelDisplay: (UILabel *) target {
	target.hidden = !target.hidden;
}

- (void) shiftImageLeft: (UIImageView *) target {
	target.center = CGPointMake(target.center.x - 20, target.center.y);
}

- (void) startupAnimations {
	
	for (int i = 1; i <= 7; i++) {
		[self performSelector: @selector(toggleDisplay:) 
		   withObject: self.ready 
		   afterDelay: 0.5*i];
	}
	
	[self performSelector: @selector(toggleDisplay:) 
			   withObject: self.tapToWin 
			   afterDelay: 0.5*7];
	
	for (int i = 1; i <= 6; i++) {
		[self performSelector: @selector(toggleDisplay:) 
		   withObject: self.instructions 
		   afterDelay: 3.5 + 0.5*i];
	}
	
	[self performSelector: @selector(shiftImageLeft:)
			   withObject: self.instructions
			   afterDelay: 7];
	
	[self performSelector: @selector(toggleLabelDisplay:)
			   withObject: self.counterLabel
			   afterDelay: 4.0];

	[self performSelector: @selector(toggleLabelDisplay:)
			   withObject: self.totalTaps
			   afterDelay: 4.0];

}

- (void) startCountdownAnimation {
	
	for (int i = 1; i <= 7; i++) {
		[self performSelector: @selector(toggleDisplay:) 
		   withObject: instructions 
		   afterDelay: 0.5*i];
	}
}

- (void) initializeTimer {
	gameOn = YES;
	if (timer == nil) {
		float interval = 1.0/30.0;
		[NSTimer scheduledTimerWithTimeInterval: interval 
										 target: self 
									   selector: @selector(gameLogic:) 
									   userInfo: nil 
										repeats: YES];
	}
	
}

#pragma mark -
#pragma mark Game Logic

- (void) gameLogic: (NSTimer *)timer {
	gameOn = YES;
	intervalsElapsed++;
	tps = count/(intervalsElapsed/30.0);
	counterLabel.text = [NSString stringWithFormat: @"%d", count];
	
	for (UIImageView *t in taps) {
		if (t.alpha < 1) {
			t.highlighted = NO;
			t.alpha -= 0.1;
		}
	}
	
	if (timeLimit - intervalsElapsed/30 <= 5) {
		if (intervalsElapsed%10 == 0) {
			[self toggleDisplay: instructions];
		}
		if ((timeLimit*30 - intervalsElapsed)%10 == 0) {
			NSString *imageName = [NSString stringWithFormat:@"countdown_%d.png", timeLimit - intervalsElapsed/30];
			instructions.image = [UIImage imageNamed: imageName];
			[instructions sizeToFit];
			instructions.contentMode = UIViewContentModeScaleAspectFit;
		}
	}
	
	if (intervalsElapsed/30 > timeLimit) {
		gameOn = NO;
		if (flashLayer.alpha < 1) {
			flashLayer.alpha += 0.1;
		}
	}
	
	if (self.flashLayer.alpha >= 1) {
		[timer invalidate];
		
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		BOOL post_online = (BOOL) [defaults objectForKey: kScoresUploadKey];
		if (post_online) {
			[self submitHighScoreWithUsername: [defaults objectForKey: kUsernameKey]];
		}
		
		self.resultViewController = [[ResultViewController alloc] initWithNibName: @"ResultView" 
																		   bundle: nil];
		self.resultViewController.delegate = self;
		self.resultViewController.tps = tps;
		self.resultViewController.totalTaps = count;
		self.resultViewController.seconds = intervalsElapsed/30;
		self.resultViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		[self presentModalViewController: self.resultViewController 
								animated: YES];
	}

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
    [super viewDidLoad];
//	if (tap == nil) {
//		tap = [[UIImage imageNamed: @"tap.png"] retain];
//	}
	// counterLabel.font = [UIFont fontWithName: @"Silom" size: 90];
	
	for (UIView *v in self.view.subviews) {
		if ([v isKindOfClass:[UILabel class]]) {
		  UILabel *label = (UILabel*)v;

		  [label setFont:[UIFont fontWithName:@"Silom" size:label.font.pointSize]];
		}
	}
	
	gameOn = NO;
	intervalsElapsed = 0;
	timeLimit = arc4random() % 1 + 10;	// timeLimit is anywhere from 10 to 20 seconds
	taps = [[NSMutableArray alloc] init];
	[self startupAnimations];
	[self performSelector: @selector(initializeTimer) 
			   withObject: nil 
			   afterDelay: 4];
	NSLog(@"Done.");

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
	
	self.tapToWin = nil;
	self.ready = nil;
	self.instructions = nil;
	self.totalTaps = nil;
 	self.taps = nil;
	self.resultViewController = nil;
}


- (void)dealloc {
	[tapToWin release];
	[ready release];
	[instructions release];
	[totalTaps release];
	[taps release];
    [resultViewController release];
	[super dealloc];
}

@end
