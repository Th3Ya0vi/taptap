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


#import "TapTapAppDelegate.h"
#import "RootViewController.h"

#import "OpenFeint/OpenFeint.h"
#import "TapTapOFDelegate.h"
#import "OpenFeint/OFControllerLoader.h"

@implementation TapTapAppDelegate

@synthesize window;
@synthesize viewController;

@synthesize highScores;

#pragma mark -
#pragma mark OpenFeint Methods

- (void) performOpenFeintStartUpLogic {
	
	
	NSDictionary* settings = [NSDictionary dictionaryWithObjectsAndKeys:
						  [NSNumber numberWithInt:UIInterfaceOrientationPortrait], OpenFeintSettingDashboardOrientation,
						  @"TapTap", OpenFeintSettingShortDisplayName,
						  [NSNumber numberWithBool:YES], OpenFeintSettingEnablePushNotifications,
						  [NSNumber numberWithBool:NO], OpenFeintSettingDisableUserGeneratedContent,
						  [NSNumber numberWithBool:NO], OpenFeintSettingAlwaysAskForApprovalInDebug,
						  window, OpenFeintSettingPresentationWindow,
						  nil
						  ];
							  
	ofDelegate = [TapTapOFDelegate new];

	OFDelegatesContainer* delegates = [OFDelegatesContainer containerWithOpenFeintDelegate:ofDelegate];

	[OpenFeint initializeWithProductKey: @"j1vDMZpKGssFw3uGjBHB7w"
							  andSecret: @"9cNrdk8cuCsco0opqFFKTEulo7uel3GzgHg6dZTEA"
						 andDisplayName: @"TapTap"
							andSettings: settings
						   andDelegates: delegates];
}

#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];
	
	[self getHighScores];
	[self performOpenFeintStartUpLogic];
	[OpenFeint respondToApplicationLaunchOptions: launchOptions];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults synchronize];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	[OpenFeint shutdown];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
	[highScores release];
	
	[ofDelegate release];
    [super dealloc];
}

#pragma mark -
#pragma mark XML Parsing Methods

- (void) parseHighScores:(NSData *)highScoresXMLData {
	if (highScoresParser) {
		[highScoresParser release];
	}
	highScoresParser = [[NSXMLParser alloc] initWithData: highScoresXMLData];
	[highScoresParser setDelegate: self];
	[highScoresParser parse];
}

- (void) parser: (NSXMLParser *) parser
didStartElement: (NSString *) elementName
   namespaceURI: (NSString *) namespaceURI
  qualifiedName: (NSString *) qName
	 attributes: (NSDictionary *) attrDict {
	
	currentKey = nil;
	[currentStringValue release];
	currentStringValue = nil;
	
	if ([elementName isEqualToString: @"django-objects"]) {
		if (highScores) {	// if NSMutableArray *highScores has objects already in it...
			[highScores removeAllObjects];	// ...empty those values
		} else {
			highScores = [[NSMutableArray alloc] init];
		}
		return;
	}
	
	if ([elementName isEqualToString: @"object"] && 
		[[attrDict objectForKey: @"model"] isEqualToString: @"taptap.highscore"]) {
		newScore = [[NSMutableDictionary alloc] initWithCapacity: 2];
		return;
	}
	
	if ([elementName isEqualToString: @"field"] && 
		[[attrDict objectForKey: @"name"] isEqualToString: @"score"]) {
		currentKey = @"score";
		return;
	}
	
	if ([elementName isEqualToString: @"field"] && 
		[[attrDict objectForKey: @"name"] isEqualToString: @"player_name"]) {
		currentKey = @"player_name";
		return;
	}
}


- (void) parser: (NSXMLParser *) parser
foundCharacters: (NSString *) string {
	if (currentKey) {
		if (!currentStringValue) {
			currentStringValue = [[NSMutableString alloc] initWithCapacity: 50];
		}
		[currentStringValue appendString: string];
	}
}

- (void) parser: (NSXMLParser *) parser
  didEndElement: (NSString *) elementName
   namespaceURI: (NSString *) namespaceURI
  qualifiedName: (NSString *) qName {
	if ([elementName isEqualToString: @"django-objects"]) {
		// finished parsing, have reached final element tag
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
		return;
	}
	
	if ([elementName isEqualToString: @"object"]) {
		// Log the results
		[highScores addObject: newScore];
	}
	
	if ([elementName isEqualToString: @"field"]) {
		if (currentKey != nil && currentStringValue != nil) {
			[newScore setValue: currentStringValue 
						forKey: currentKey];
		}
	}
	
	currentKey = nil;
	[currentStringValue release];
	currentStringValue = nil;
}

#pragma mark -
#pragma mark Web Service Connection Methods

#define HIGH_SCORES_URL	@"http://modocache.webfactional.com/apps/taptap/leaderboard.xml"

- (void) getHighScores {
	[self getHighScoresFromWebService: HIGH_SCORES_URL];
}

- (void) getHighScoresFromWebService: (NSString *) urlString {
	
	NSLog(@"Connecting to web service.");
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
	
	NSURL *url = [NSURL URLWithString: urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL: url 
											 cachePolicy: NSURLRequestUseProtocolCachePolicy 
										 timeoutInterval: 10.0];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request 
																  delegate: self];
	
	if (connection) {
		responseData = [[NSMutableData data] retain];
	} else {
		// connection request is invalid. note that even 404 and 500 responses are indicative of a valid request
		NSLog(@"An error occurred when requesting data from URL.");
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
	}

	
}

#pragma mark -
#pragma mark NSURLConnectionDelegate Methods

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
	NSLog(@"Error connecting - %@", [error localizedFailureReason]);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not Connected to the Internet" 
													message: @"Leaderboard data could not be downloaded." 
												   delegate: self 
										  cancelButtonTitle: @"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
	[connection release];
	[responseData release];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
	NSInteger statusCode = [httpResponse statusCode];
	if ( statusCode == 404 || statusCode == 500) {
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
		[connection cancel];
		NSLog(@"Server Error - %d: %@", statusCode, [NSHTTPURLResponse localizedStringForStatusCode: statusCode]);
	} else {
		[responseData setLength: 0];
	}

}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData: data];
}


- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
	[self parseHighScores: responseData];
	[connection release];
	[responseData release];
}


@end
