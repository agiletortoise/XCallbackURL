//
//  ReceiveViewController.h
//  XCallbackURL
//
//  Created by Greg Pierce on 11/24/10.
//  Copyright 2010 Agile Tortoise. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReceiveViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate> {
	IBOutlet UITextView	*urlTextView;
}

- (void)setReceivedURL:(NSURL *)url;

@end
