//
//  TapTapAppDelegate.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class TapTapOFDelegate;

@interface TapTapAppDelegate : NSObject <UIApplicationDelegate, NSXMLParserDelegate> {
    UIWindow *window;
    RootViewController *viewController;
	
	// XML parsing
	NSMutableData *responseData;
	NSXMLParser *highScoresParser;
	NSMutableArray *highScores;
	NSMutableDictionary *newScore;
	NSString *currentKey;
	NSMutableString *currentStringValue;

	// OpenFeint
	TapTapOFDelegate *ofDelegate;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController *viewController;

// XML parsing
@property (nonatomic, retain) NSMutableArray *highScores;

- (void) getHighScores;
- (void) getHighScoresFromWebService: (NSString *) urlString;
- (void) parseHighScores: (NSData *) highScoresXMLData;



@end

