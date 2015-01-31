//
//  HomeViewController.m
//  PickBitsa
//
//  Created by Peerincle on 28/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    // current user is logged in, show the album
    NetworkAPI *netapi = [[NetworkAPI alloc] init];
    PFUser *user;
    if(netapi.isAuthorized)
    {
        user = [PFUser currentUser];
        self.LoginSignin.hidden = YES;
        [self performSegueWithIdentifier:@"loginsuccess" sender:self];
    }
    else
    {
        self.LoginSignin.hidden = NO;
    }
    

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

@end
