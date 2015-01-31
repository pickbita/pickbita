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

-(BOOL) isAuthorized
{
    if (![PFUser currentUser] ) { // No user logged in
        return false;
    }
    else{
        PFUser *cuser = [PFUser currentUser];
        [[[UIAlertView alloc] initWithTitle:@"Logged in"
                                    message:[NSString stringWithFormat:@"Welcome %@", cuser.username]
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
        return true;
    }
}

-(BOOL) UserSignin:(NSString*)UserName
          Password: (NSString*)UserPassword
    RepeatPassword:(NSString*)RepeatPasswrod
             email:(NSString*)UserEmail
{
    __block BOOL isSignedIn = false;
    
    if (UserName.length<4 || UserPassword.length<4 || UserEmail.length<4) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Please enter User information!"
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
    }
    
    if (UserPassword != RepeatPasswrod) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Please enter password again!"
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
    }
    
    isSignedIn = YES;
    
    PFUser *user = [PFUser user];
    user.username = UserName;
    user.password = UserPassword;
    user.email = UserEmail;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            isSignedIn = NO;
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [[[UIAlertView alloc] initWithTitle:@"Error"
                                        message:errorString
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles: nil] show];
        }
        
    }];
    
    return isSignedIn;
}

-(BOOL) upload: (PFUser *) user
     imageData: (NSData *) imageData
    imageTitle: (NSString*) imageTitle
{
    __block BOOL isUploaded = NO;
    
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:user.username];
    userPhoto[@"imageName"] = imageTitle;
    userPhoto[@"imageFile"] = imageFile;
    [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            [[[UIAlertView alloc] initWithTitle:@"Success"
                                        message:@"Photo uploaded!"
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles: nil] show];
            isUploaded = YES;
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [[[UIAlertView alloc] initWithTitle:@"Error"
                                        message:errorString
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles: nil] show];
        }
    }];
    
    return isUploaded;
}


-(UIImage *) download:(PFUser *) user
          imageObject:(PFObject *) imageObject;
{
    __block UIImage *image;
    PFFile *userImageFile = imageObject[@"imageFile"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            image = [UIImage imageWithData:imageData];
        }
    }];
    return image;
}

@end
