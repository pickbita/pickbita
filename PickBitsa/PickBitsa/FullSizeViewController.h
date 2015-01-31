//
//  FullSizeViewController.h
//  PickBitsa
//
//  Created by Peerincle on 31/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullSizeViewController : UIViewController

@property (assign, nonatomic) id PhotoId;
@property (assign, nonatomic) NSString *imageId;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
