 //
//  LoginScreen.m
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "LoginScreen.h"
#import "UIAlertView+error.h"

@implementation LoginScreen

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //focus on the username field / show keyboard
    [fldUsername becomeFirstResponder];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)btnLoginRegisterTapped:(UIButton*)sender
{
    //form fields validation
    if (fldUsername.text.length < 4 || fldPassword.text.length < 4) {
        [UIAlertView error:@"Enter username and password over 4 chars each."];
        return;
    }
    
    [PFUser logInWithUsernameInBackground:fldUsername.text password:fldPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                                            //show message to the user
                                            [[[UIAlertView alloc] initWithTitle:@"Logged in"
                                                                        message:[NSString stringWithFormat:@"Welcome %@",user.username ]
                                                                       delegate:nil 
                                                              cancelButtonTitle:@"Close" 
                                                              otherButtonTitles: nil] show];
                                        } else {
                                            [UIAlertView error:@"Login Failed!"];
                                            return;
                                        }
                                    }];}

@end
