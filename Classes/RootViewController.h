//
//  RootViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface RootViewController : UIViewController {
	MainMenuViewController *mainMenuViewController;
}

@property (nonatomic, retain) MainMenuViewController *mainMenuViewController;

@end
