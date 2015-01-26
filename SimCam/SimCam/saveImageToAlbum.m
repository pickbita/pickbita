//
//  saveImageToAlbum.m
//  SimCam
//
//  Created by Peerincle on 25/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "saveImageToAlbum.h"

@implementation saveImageToAlbum



- (void)saveImageWithAlbum:(UIImage*)image toAlbum:(NSString*)albumName metadata:(NSDictionary*)imagemd withCompletionBlock:(SaveImageCompletion)completionBlock
{
    //write the image data to the assets library (camera roll)
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library writeImageToSavedPhotosAlbum:image.CGImage
                                 metadata:imagemd
                          completionBlock:^(NSURL* assetURL, NSError* error) {
                              if (error!=nil) {
                                  completionBlock(error);
                                  return;
                              }
                              [self addAssetURL: assetURL
                                        toAlbum:albumName
                            withCompletionBlock:completionBlock];
                              
                          }];
}

- (void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    __block BOOL albumWasFound = NO;
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library enumerateGroupsWithTypes:ALAssetsGroupAlbum
                           usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                               if ([albumName compare: [group valueForProperty:ALAssetsGroupPropertyName]]==NSOrderedSame) {
                                   albumWasFound = YES;
                                   
                                   [library assetForURL: assetURL
                                            resultBlock:^(ALAsset *asset) {
                                                [group addAsset: asset];
                                                completionBlock(nil);
                                            } failureBlock: completionBlock];
                                   return;
                               }
                               
                               if (group==nil && albumWasFound==NO) {
                                   
                                   __weak ALAssetsLibrary* weakSelf = library;
                                   [library addAssetsGroupAlbumWithName:albumName
                                                            resultBlock:^(ALAssetsGroup *group) {
                                                                [weakSelf assetForURL: assetURL
                                                                          resultBlock:^(ALAsset *asset) {
                                                                              [group addAsset: asset];
                                                                              completionBlock(nil);
                                                                          } failureBlock: completionBlock];
                                                                
                                                            } failureBlock: completionBlock];
                                   return;
                               }
                           } failureBlock: completionBlock];
}

@end
