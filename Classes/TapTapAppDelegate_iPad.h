//
//  TapTapAppDelegate.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController_iPad;

@interface TapTapAppDelegate_iPad : NSObject <UIApplicationDelegate, NSXMLParserDelegate> {
    UIWindow *window;
    RootViewController_iPad *viewController;
	
	// XML parsing
	NSMutableData *responseData;
	NSXMLParser *highScoresParser;
	NSMutableArray *highScores;
	NSMutableDictionary *newScore;
	NSString *currentKey;
	NSMutableString *currentStringValue;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController_iPad *viewController;

// XML parsing
@property (nonatomic, retain) NSMutableArray *highScores;

- (void) getHighScores;
- (void) getHighScoresFromWebService: (NSString *) urlString;
- (void) parseHighScores: (NSData *) highScoresXMLData;

@end

