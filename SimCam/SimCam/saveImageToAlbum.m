//
//  saveImageToAlbum.m
//  SimCam
//
//  Created by Peerincle on 25/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "saveImageToAlbum.h"

@implementation saveImageToAlbum



- (void)saveImageWithAlbum:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    //write the image data to the assets library (camera roll)
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:image.CGImage orientation:(ALAssetOrientation)image.imageOrientation
                          completionBlock:^(NSURL* assetURL, NSError* error) {
                              
                              //error handling
                              if (error!=nil) {
                                  completionBlock(error);
                                  return;
                              }
                              
                              //add the asset to the custom photo album
                              [self addAssetURL: assetURL
                                        toAlbum:albumName
                            withCompletionBlock:completionBlock];
                              
                          }];
}

- (void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    __block BOOL albumWasFound = NO;
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    //search all photo albums in the library
    [library enumerateGroupsWithTypes:ALAssetsGroupAlbum
                           usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                               
                               //compare the names of the albums
                               if ([albumName compare: [group valueForProperty:ALAssetsGroupPropertyName]]==NSOrderedSame) {
                                   
                                   //target album is found
                                   albumWasFound = YES;
                                   
                                   //get a hold of the photo's asset instance
                                   [library assetForURL: assetURL
                                            resultBlock:^(ALAsset *asset) {
                                                
                                                //add photo to the target album
                                                [group addAsset: asset];
                                                
                                                //run the completion block
                                                completionBlock(nil);
                                                
                                            } failureBlock: completionBlock];
                                   
                                   //album was found, bail out of the method
                                   return;
                               }
                               
                               if (group==nil && albumWasFound==NO) {
                                   //photo albums are over, target album does not exist, thus create it
                                   
                                   __weak ALAssetsLibrary* weakSelf = library;
                                   
                                   //create new assets album
                                   [library addAssetsGroupAlbumWithName:albumName
                                                            resultBlock:^(ALAssetsGroup *group) {
                                                                
                                                                //get the photo's instance
                                                                [weakSelf assetForURL: assetURL
                                                                          resultBlock:^(ALAsset *asset) {
                                                                              [group addAsset: asset];
                                                                              completionBlock(nil);
                                                                          } failureBlock: completionBlock];
                                                                
                                                            } failureBlock: completionBlock];
                                   
                                   //should be the last iteration anyway, but just in case
                                   return;
                               }
                               
                           } failureBlock: completionBlock];
    
}

@end
