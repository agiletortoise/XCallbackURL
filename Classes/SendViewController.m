//
//  SendViewController.m
//  XCallbackURL
//
//  Created by Greg Pierce on 11/24/10.
//  Copyright 2010 Agile Tortoise. All rights reserved.
//

#import "SendViewController.h"


@implementation SendViewController

- (id)init {
	if (!(self = [super initWithNibName:nil bundle:nil])) return nil;
	
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:@"Send URL"];
	
	UIImage *image = [UIImage imageNamed:@"send.png"];
	[tbi setImage:image];
	
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	return [self init];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSString *)encodeString:(NSString *)str
{
	return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
															   NULL,
															   (CFStringRef)str,
															   NULL,
															   (CFStringRef)@"!*'();:@&=+$,/?%#[]",
															   kCFStringEncodingUTF8 ));
}

- (BOOL)canOpenURL
{
	if( [[schemeField text] length] == 0 ||
	    [[hostField text] length] == 0 ||
	    [[actionField text] length] == 0 )
	{
		return NO;
	}
	return YES;
}

-(void)openURL
{
	if (![self canOpenURL]) {
		UIAlertView *alertView = [[UIAlertView alloc] 
								  initWithTitle:@"Error"
								  message:@"Required fields missing."
								  delegate:nil
								  cancelButtonTitle:@"OK"
								  otherButtonTitles:nil];
		[alertView show];
		return;
	}
	
	
	NSString *urlString = [schemeField text];
	urlString = [urlString stringByAppendingString:@"://"];
	urlString = [urlString stringByAppendingString:[hostField text]];
	urlString = [urlString stringByAppendingString:@"/"];
	// 2011.03.21 by GP - no longer requiring version
    //urlString = [urlString stringByAppendingString:[versionField text]];
	//urlString = [urlString stringByAppendingString:@"/"];
	// END
    urlString = [urlString stringByAppendingString:[actionField text]];
	urlString = [urlString stringByAppendingString:@"?"];
	
	if ([[callbackField text] length] > 0) {
		urlString = [urlString stringByAppendingString:@"x-success="];
		urlString = [urlString stringByAppendingString:[self encodeString:[callbackField text]]];
		urlString = [urlString stringByAppendingString:@"&"];
	}
	if ([[errorCallbackField text] length] > 0) {
		urlString = [urlString stringByAppendingString:@"x-error="];
		urlString = [urlString stringByAppendingString:[self encodeString:[errorCallbackField text]]];
		urlString = [urlString stringByAppendingString:@"&"];
	}
    if ([[cancelCallbackField text] length] > 0) {
		urlString = [urlString stringByAppendingString:@"x-cancel="];
		urlString = [urlString stringByAppendingString:[self encodeString:[cancelCallbackField text]]];
		urlString = [urlString stringByAppendingString:@"&"];
	}
	if ([[sourceField text] length] > 0) {
		urlString = [urlString stringByAppendingString:@"x-source="];
		urlString = [urlString stringByAppendingString:[self encodeString:[sourceField text]]];
		urlString = [urlString stringByAppendingString:@"&"];
	}
    
    urlString = [urlString stringByAppendingString:[parametersField text]];
	
	
	NSLog(@"%@",urlString);
	NSURL *url = [NSURL URLWithString:urlString];
	if([[UIApplication sharedApplication] canOpenURL:url] == YES) {
		[[UIApplication sharedApplication] openURL:url];
	}
	else {
		NSLog(@"Unable to open url");
	}
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[textField resignFirstResponder];
}

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
}




@end
