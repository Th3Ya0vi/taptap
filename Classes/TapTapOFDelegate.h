//
//  TapTapOFDelegate.h
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenFeint/OpenFeintDelegate.h"


@interface TapTapOFDelegate : NSObject <OpenFeintDelegate> 

- (void)dashboardWillAppear;
- (void)dashboardDidAppear;
- (void)dashboardWillDisappear;
- (void)dashboardDidDisappear;
- (void)userLoggedIn:(NSString*)userId;
- (BOOL)showCustomOpenFeintApprovalScreen;

@end
