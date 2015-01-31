//
//  PhotoView.h
//  PickBitsa
//
//  Created by Peerincle on 31/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//
#import <UIKit/UIKit.h>

//1 layout config
#define kThumbSide 90
#define kPadding 10

//2 define the thumb delegate protocol
@protocol PhotoViewDelegate <NSObject>
-(void)didSelectPhoto:(id)sender;
@end

//3 define the thumb view interface
@interface PhotoView : UIButton

@property (assign, nonatomic) id<PhotoViewDelegate> delegate;

-(id)initWithIndex:(int)i andData:(NSDictionary*)data;

@end
