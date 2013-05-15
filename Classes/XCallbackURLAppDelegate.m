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


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}




@end
