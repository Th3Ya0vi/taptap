//
//  TapTapAppDelegate.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface TapTapAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RootViewController *viewController;
	
	// XML parsing
	NSMutableData *responseData;
	NSXMLParser *highScoresParser;
	NSMutableArray *highScores;
	NSMutableDictionary *newScore;
	NSString *currentKey;
	NSMutableString *currentStringValue;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController *viewController;

// XML parsing
@property (nonatomic, retain) NSMutableArray *highScores;

- (void) getHighScore;
- (void) getHighScoresFromWebService: (NSString) *urlString;
- (void) parseHighScores: (NS Data *) highScoresXMLData;

@end

