//
//  NetworkAPI.h
//  PickBitsa
//
//  Created by Peerincle on 28/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface NetworkAPI : NSObject

@property (strong,atomic) PFUser *User;

-(BOOL) isAuthorized;

-(BOOL) UserLogin: (NSString*)UserName Password: (NSString*)UserPassword;

-(BOOL) UserSignin:(NSString*)UserName
          Password: (NSString*)UserPassword
    RepeatPassword:(NSString*)RepeatPasswrod
             email:(NSString*)UserEmail;

-(BOOL) upload: (PFUser *) user
     imageData: (NSData *) imageData
    imageTitle: (NSString*) imageTitle;

-(UIImage *) download:(PFUser *) user
          imageObject:(PFObject *) imageObject;


@end
