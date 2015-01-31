//
//  StreamViewController.m
//  PickBitsa
//
//  Created by Peerincle on 29/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "StreamViewController.h"

@interface StreamViewController ()

@end

@implementation StreamViewController

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

- (IBAction)TakePic:(id)sender {

}

- (IBAction)GoHome:(id)sender {
    //test download image
    NetworkAPI *netapi = [[NetworkAPI alloc] init];
    PFUser *user = [PFUser currentUser];
    PFObject *userPhoto = [PFObject objectWithClassName:user.username];
    userPhoto[@"imageName"] = nil;
    userPhoto[@"imageFile"] = nil;
    
    UIImage *image = [netapi download:user imageObject:userPhoto];
    self.testDownloadImage.image = image;
}

- (IBAction)Activities:(id)sender {
}


@end
