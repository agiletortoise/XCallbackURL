//
//  XCallbackURLAppDelegate.m
//  XCallbackURL
//
//  Created by Greg Pierce on 11/24/10.
//  Copyright 2010 Agile Tortoise. All rights reserved.
//

#import "XCallbackURLAppDelegate.h"
#import "SendViewController.h"
#import	"ReceiveViewController.h"

@implementation XCallbackURLAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    tabBarController = [[UITabBarController alloc] init];	
	[self.window addSubview:[tabBarController view]];	
	
	sendView = [[SendViewController alloc] init];
	receiveView = [[ReceiveViewController alloc] init];
	
	NSArray	*viewControllers = [NSArray arrayWithObjects:sendView,receiveView,nil];
	
	[tabBarController setViewControllers:viewControllers];
	
    [self.window makeKeyAndVisible];
    return YES;
}

/* This method is used to handle incoming URLs
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
	NSLog(@"%@", [url absoluteString]);
	[receiveView setReceivedURL:url];
	return YES;
}

/* Deprecated forwarding method implemented for backward compatibility with iOS < 4.0
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	return [self application:application openURL:url sourceApplication:@"com.unknown.unknown" annotation:nil];
}

@end
