//
//  APPViewController.h
//  SimCam
//
//  Created by Peerincle on 12/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "saveImageToAlbum.h"

typedef void(^SaveImageCompletion)(NSError* error);

@interface APPViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property bool isSaved;

@property(nonatomic,retain) UIImage *saveimage;

- (IBAction)takePhoto:  (UIButton *)sender;

- (IBAction)selectPhoto:(UIButton *)sender;

- (IBAction)savePhoto:(UIButton *)sender;



@end
