//
//  PhotoViewController.h
//  PickBitsa
//
//  Created by Peerincle on 29/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "NetworkAPI.h"

@interface PhotoViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)Select:(id)sender;
- (IBAction)TakePhoto:(id)sender;
- (IBAction)SavePhoto:(id)sender;

@end
