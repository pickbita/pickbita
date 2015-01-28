//
//  LoginViewController.m
//  PickBitsa
//
//  Created by Peerincle on 28/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

*/

- (IBAction)UserLogin:(id)sender {
    if (self.UserName.text.length < 4 || self.UserPassword.text.length < 4) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Please Enter Username and Passwords"
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles:nil, nil] show];
        return;
    }
    
    [PFUser logInWithUsernameInBackground:self.UserName.text password:self.UserPassword.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            //show message to the user
            [[[UIAlertView alloc] initWithTitle:@"Logged in"
                                        message:[NSString stringWithFormat:@"Welcome %@",user.username ]
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles: nil] show];
            // Show home view
            
            
        } else {
            
            [[[UIAlertView alloc] initWithTitle:@"Login Failed"
                                        message:@"Username or passwords error, please try again"
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles:nil, nil] show];
        }
    }];

}

- (IBAction)UserSignUp:(id)sender {
    if (self.UserName.text.length < 4 || self.UserPassword.text.length < 4) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Please Enter Username and Passwords"
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles:nil, nil] show];
        
    }
    
    PFUser *user = [PFUser user];
    user.username = self.UserName.text;
    user.password = self.UserPassword.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [[[UIAlertView alloc] initWithTitle:@"Signed in success"
                                        message:@"Please login again!"
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles:nil, nil] show];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [[[UIAlertView alloc] initWithTitle:@"Signed in failed"
                                        message:errorString
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles:nil, nil] show];
        }
    }];
    
    self.UserPassword.text = @"";
}
@end
