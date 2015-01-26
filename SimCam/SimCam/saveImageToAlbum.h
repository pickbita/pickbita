//
//  saveImageToAlbum.h
//  SimCam
//
//  Created by Peerincle on 25/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

typedef void(^SaveImageCompletion)(NSError* error);

@interface saveImageToAlbum : NSObject

// save image to "SimPhoto"
-(void)saveImageWithAlbum:(UIImage*)image toAlbum:(NSString*)albumName metadata:(NSDictionary*)imagemd withCompletionBlock:(SaveImageCompletion)completionBlock;

-(void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;

@end
