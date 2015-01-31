//
//  LoginViewController.h
//  PickBitsa
//
//  Created by Peerincle on 28/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController


- (IBAction)UserLogin:(id)sender;
- (IBAction)UserSignUp:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *UserName;
@property (strong, nonatomic) IBOutlet UITextField *UserPassword;
@property (strong, nonatomic) IBOutlet UITextField *UserEmail;
@property (strong, nonatomic) IBOutlet UITextField *UserRepeatPassword;


@end
