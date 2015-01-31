//
//  FullSizeViewController.m
//  PickBitsa
//
//  Created by Peerincle on 31/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "FullSizeViewController.h"
#import <Parse/Parse.h>
#import "NetworkAPI.h"

@interface FullSizeViewController ()

@end

@implementation FullSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.imageId != nil) {
        //show photo
        PFUser *user = [PFUser currentUser];
        NetworkAPI *netapi = [[NetworkAPI alloc] init];
        UIImage *image = [netapi download:user className:user.username objectID:self.imageId];
        self.imageView.image = image;
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
