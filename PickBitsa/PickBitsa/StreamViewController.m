//
//  StreamViewController.m
//  PickBitsa
//
//  Created by Peerincle on 29/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "StreamViewController.h"
#import "FullSizeViewController.h"

@interface StreamViewController ()

@end

@implementation StreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshStream];
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
    [self refreshStream];
}

- (IBAction)Activities:(id)sender {
}

-(void)refreshStream
{
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:user.username];
    NSArray* imageArray = [query findObjects];
    [self showStream:imageArray];
}

-(void)showStream:(NSArray*)stream {
    // 1 remove old photos
    for (UIView* view in self.listView.subviews) {
        [view removeFromSuperview];
    }
    // 2 add new photo views
    int i = 0;
    for (PFObject *object in stream) {
        NSString *objectID = object.objectId;
        PhotoView* photoView = [[PhotoView alloc] initWithIndex:i imageIndex:i objectId:objectID];

        [self.listView addSubview: photoView];
        i++;
    }
    // 3 update scroll list's height
    int listHeight = ([stream count]/3 + 1)*(kThumbSide+kPadding);
    [self.listView setContentSize:CGSizeMake(320, listHeight)];
    [self.listView scrollRectToVisible:CGRectMake(0, 0, 10, 10) animated:YES];
}

-(void)didSelectPhoto:(PhotoView*)sender {
    //photo selected - show it full screen
    [self performSegueWithIdentifier:@"ShowPhoto" sender:sender.objectId];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString *)sender {
    if ([@"ShowPhoto" compare: segue.identifier]==NSOrderedSame) {
        FullSizeViewController *streamPhotoScreen = segue.destinationViewController;
        streamPhotoScreen.imageId = sender;
    }
}

@end
