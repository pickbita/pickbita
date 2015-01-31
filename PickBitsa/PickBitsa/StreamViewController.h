//
//  StreamViewController.h
//  PickBitsa
//
//  Created by Peerincle on 29/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoView.h"
#import "NetworkAPI.h"

@interface StreamViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (IBAction)TakePic:(id)sender;

- (IBAction)GoHome:(id)sender;

- (IBAction)Activities:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *listView;

-(void)showStream:(NSArray*)stream;
-(void)refreshStream;

@end
