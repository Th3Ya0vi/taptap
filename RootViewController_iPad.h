//
//  TapTapViewController.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController_iPad;

@interface RootViewController_iPad : UIViewController {
	MainMenuViewController_iPad *mainMenuViewController;
}

@property (nonatomic, retain) MainMenuViewController_iPad *mainMenuViewController;

@end

