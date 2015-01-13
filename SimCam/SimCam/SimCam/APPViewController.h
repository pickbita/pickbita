//
//  APPViewController.h
//  SimCam
//
//  Created by Peerincle on 12/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;

- (IBAction)selectPhoto:(UIButton *)sender;

- (IBAction)savePhoto:(UIButton *)sender;

@end
