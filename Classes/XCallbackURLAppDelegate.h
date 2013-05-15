//
//  XCallbackURLAppDelegate.h
//  XCallbackURL
//
//  Created by Greg Pierce on 11/24/10.
//  Copyright 2010 Agile Tortoise. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SendViewController;
@class ReceiveViewController;

@interface XCallbackURLAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;
	SendViewController *sendView;
	ReceiveViewController *receiveView;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;

@end

