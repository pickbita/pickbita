//
//  API.h
//  iReporter
//
//  Created by Peerincle on 11/01/2015.
//  Copyright (c) 2015 Marin Todorov. All rights reserved.
//

#import <Parse/Parse.h>

#define USE_PARSE YES
#define USE_JSON  NO

@interface API : PFObject

@property (strong,nonatomic) PFUser *user;

+(BOOL) isAuthorized;

+(API*)sharedInstance;

//-(void)commandWithParams:(PFQuery*)pfQuery onCompletion:(PFObjectResultBlock)completionBlock;

@end
