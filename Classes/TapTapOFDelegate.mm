//
//  TapTapOFDelegate.mm
//  TapTap
//
//  Created by Brian Ivan Gesiak on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TapTapOFDelegate.h"
#import "OpenFeint/OpenFeint+UserOptions.h"


@implementation TapTapOFDelegate


- (void)dashboardWillAppear
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
}

- (void)dashboardDidAppear
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
}

- (void)dashboardWillDisappear
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
}

- (void)dashboardDidDisappear
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
}

- (void)offlineUserLoggedIn:(NSString*)userId
{
	NSLog(@"User logged in, but OFFLINE. UserId: %@", userId);
}

- (void)userLoggedIn:(NSString*)userId
{
	NSLog(@"User logged in. UserId: %@", userId);
}

- (BOOL)showCustomOpenFeintApprovalScreen
{
	return NO;
}


@end
