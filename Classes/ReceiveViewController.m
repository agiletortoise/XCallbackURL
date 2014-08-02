//
//  ReceiveViewController.m
//  XCallbackURL
//
//  Created by Greg Pierce on 11/24/10.
//  Copyright 2010 Agile Tortoise. All rights reserved.
//

#import "ReceiveViewController.h"

@implementation ReceiveViewController

- (id)init 
{
	if (!(self = [super initWithNibName:nil bundle:nil])) return nil;
	
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:@"Receive URL"];

	UIImage *image = [UIImage imageNamed:@"receive.png"];
	[tbi setImage:image];
	
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
	return [self init];
}

- (void)setReceivedURL:(NSURL *)url
{
	if(![self isViewLoaded]) {
		[self loadView];
	}
	[urlTextView setText:[url absoluteString]];
}

@end
