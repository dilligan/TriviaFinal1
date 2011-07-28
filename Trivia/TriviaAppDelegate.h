//
//  TriviaAppDelegate.h
//  Trivia
//
//  Created by iD Student Account on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TriviaViewController;

@interface TriviaAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TriviaViewController *viewController;

@end
