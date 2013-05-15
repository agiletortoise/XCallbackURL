//
//  SendViewController.h
//  XCallbackURL
//
//  Created by Greg Pierce on 11/24/10.
//  Copyright 2010 Agile Tortoise. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SendViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UITextField *schemeField;
	IBOutlet UITextField *hostField;
	IBOutlet UITextField *actionField;
	IBOutlet UITextField *parametersField;
	IBOutlet UITextField *callbackField;
	IBOutlet UITextField *errorCallbackField;	
	IBOutlet UITextField *cancelCallbackField;
	IBOutlet UITextField *sourceField;
}

- (IBAction)openURL;

@end
