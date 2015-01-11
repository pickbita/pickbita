//
//  API.m
//  iReporter
//
//  Created by Peerincle on 11/01/2015.
//  Copyright (c) 2015 Marin Todorov. All rights reserved.
//

#import "API.h"

//the web location of the service
#define kAPIHost @"http://localhost"
#define kAPIPath @"iReporter/"

@implementation API

@synthesize user;
+(BOOL)isAuthorized
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

+(API*)sharedInstance
{
    static API *sharedInstance = nil;
    static dispatch_once_t once;
    if (USE_PARSE) {
        dispatch_once(&once, ^{
            sharedInstance = [self new];
        });
    }
    else{
        //dispatch_once(&oncePredicate, ^{
        //    sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAPIHost]];
        //});
    }
    return sharedInstance;
}

#pragma mark - init
//intialize the API class with the destination host name

-(API*)init
{
    //call super init
    self = [super init];
    
    if (self != nil) {
        //initialize the object
        user = nil;
        
        if(![[PFUser currentUser] isAuthenticated])
        {
            [PFUser logOut];
        }
        else
        {
            user = [PFUser currentUser];
        }
        
    }
    
    return self;
}

@end
