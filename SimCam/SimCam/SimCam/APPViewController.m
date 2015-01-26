//
//  APPViewController.m
//  SimCam
//
//  Created by Peerincle on 12/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "APPViewController.h"


@interface APPViewController ()

@end

@implementation APPViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.isSaved = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    if(self.isSaved == NO)
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save Photo?"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Ignore"
                                                   destructiveButtonTitle:@"Save"
                                                        otherButtonTitles:nil];
        [actionSheet showInView:self.view];
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
#if TARGET_IPHONE_SIMULATOR
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
    
    [self presentViewController:picker animated:YES completion:^{}];

    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    if(self.isSaved == NO)
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save Photo?"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Ignore"
                                                   destructiveButtonTitle:@"Save"
                                                        otherButtonTitles:nil];
        [actionSheet showInView:self.view];
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    
    [self presentViewController:picker animated:YES completion:^{}];

}

- (IBAction)savePhoto:(UIButton *)sender {
    UIImage *saveimage = self.saveimage;//[self.appimg getImage];
    
    saveImageToAlbum *saveAction = [[saveImageToAlbum alloc] init];
    [saveAction saveImageWithAlbum:saveimage
                           toAlbum:@"SimPhoto"
               withCompletionBlock:^(NSError *error) {
                   if (error)
                   {
                        NSLog( @"Error writing image with metadata to Photo Library: %@", error );
                   } else
                   {
                        NSLog( @"Wrote image with metadata to Photo Library");
                   }
               }];
    
    // Get the assets library
    //ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    //ALAssetsLibraryWriteImageCompletionBlock imageWriteCompletionBlock =
    //^(NSURL *newURL, NSError *error) {
    //    if (error) {
    //        NSLog( @"Error writing image with metadata to Photo Library: %@", error );
    //    } else {
    //        NSLog( @"Wrote image with metadata to Photo Library");
    //    }
    //};
    
    // Save the new image (original or edited) to the Camera Roll
    //[library writeImageToSavedPhotosAlbum:[saveimage CGImage]
    //                             metadata:nil
    //                      completionBlock:imageWriteCompletionBlock];
    self.isSaved = YES;
    
    
}


#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;
    
    //NSDictionary *imageMetadata = [info objectForKey:
    //                               UIImagePickerControllerMediaMetadata];
    
    self.saveimage = image;
    self.isSaved = NO;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [actionSheet destructiveButtonIndex])
    {
        //----- CLICKED Save -----
        UIImage *saveimage = self.saveimage;//[self.appimg getImage];
        
        saveImageToAlbum *saveAction = [[saveImageToAlbum alloc] init];
        [saveAction saveImageWithAlbum:saveimage
                               toAlbum:@"SimPhoto"
                   withCompletionBlock:^(NSError *error) {
                       if (error)
                       {
                           NSLog( @"Error writing image with metadata to Photo Library: %@", error );
                       } else
                       {
                           NSLog( @"Wrote image with metadata to Photo Library");
                       }
                   }];
    }
    else if (buttonIndex == [actionSheet cancelButtonIndex])
    {
        //----- CLICKED Ignore -----
        
    }
    self.isSaved = YES;
}


@end
