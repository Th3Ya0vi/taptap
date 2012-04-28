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


#import <UIKit/UIKit.h>

@class ResultViewController_iPad;

@interface GameViewController_iPad : UIViewController {
	id delegate;
	ResultViewController_iPad *resultViewController;
	
	UIImageView *tapToWin;
	UIImageView *ready;
	UILabel *instructions;
	UIImageView *totalTaps;
	UIImageView *flashLayer;
	
	NSMutableArray *taps;
	UIImageView *tap;
	
	UILabel *counterLabel;
	int count;
	int tps;	// taps per second
	
	NSTimer *timer;
	int intervalsElapsed;
	int timeLimit;
	BOOL gameOn;
	float touchOffset;
}

@property (nonatomic, retain) IBOutlet UIImageView *tapToWin;
@property (nonatomic, retain) IBOutlet UIImageView *ready;
@property (nonatomic, retain) IBOutlet UILabel *instructions;
@property (nonatomic, retain) IBOutlet UIImageView *totalTaps;
@property (nonatomic, retain) IBOutlet UIImageView *flashLayer;
@property (nonatomic, retain) IBOutlet UILabel *counterLabel;
@property (nonatomic, retain) NSMutableArray *taps;

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) ResultViewController_iPad *resultViewController;

- (void) initializeTimer;
- (void) gameLogic: (NSTimer *) timer;

@end
