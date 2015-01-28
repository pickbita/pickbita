//
//  NetworkAPI.m
//  PickBitsa
//
//  Created by Peerincle on 28/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "NetworkAPI.h"

@implementation NetworkAPI

-(BOOL) UserLogin: (NSString*)UserName Password: (NSString*)UserPassword
{
    BOOL logedin=false;
    if (UserName.length < 4 || UserPassword.length < 4) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Please Enter Username and Passwords"
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles:nil, nil] show];
        return false;
    }
    
    
    [PFUser logInWithUsernameInBackground:UserName password:UserPassword block:^(PFUser *user, NSError *error) {
        if (user) {
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

    return logedin;
}


@end
