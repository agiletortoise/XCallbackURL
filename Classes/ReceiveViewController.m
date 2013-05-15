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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
