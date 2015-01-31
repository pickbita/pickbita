//
//  PhotoView.m
//  PickBitsa
//
//  Created by Peerincle on 31/01/2015.
//  Copyright (c) 2015 Peerincle. All rights reserved.
//

#import "PhotoView.h"

//add under #import "PhotoView.h"
#import "NetworkAPI.h"

//add under @implementation
//@synthesize delegate;

@implementation PhotoView

@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithIndex:(int)i
        imageIndex:(int) index
          objectId:(NSString *) objectId
{
    self = [super init];
    if (self !=nil) {
        //initialize
        self.objectId = objectId;
        PFUser *user = [PFUser currentUser];
        
        int row = i/3;
        int col = i % 3;
        
        self.frame = CGRectMake(1.5*kPadding+col*(kThumbSide+kPadding), 1.5*kPadding+row*(kThumbSide+kPadding), kThumbSide, kThumbSide);
        self.backgroundColor = [UIColor grayColor];
        
        //add the photo caption
        UILabel* caption = [[UILabel alloc] initWithFrame:
                            CGRectMake(0, kThumbSide-16, kThumbSide, 16)
                            ];
        caption.backgroundColor = [UIColor blackColor];
        caption.textColor = [UIColor whiteColor];
        caption.font = [UIFont systemFontOfSize:12];
        caption.text = [NSString stringWithFormat:@"@%@",user.username];
        [self addSubview: caption];
        
        //step 2
        //add touch event
        [self addTarget:delegate action:@selector(didSelectPhoto:) forControlEvents:UIControlEventTouchUpInside];
        
        //load the image
        NetworkAPI *netapi = [[NetworkAPI alloc] init];
        
        //
        UIImage *image = [netapi download:user className:user.username objectID:objectId];
        UIImageView* thumbView = [[UIImageView alloc] initWithImage: image];
        thumbView.frame = CGRectMake(0,0,90,90);
        thumbView.contentMode = UIViewContentModeScaleAspectFit;
        [self insertSubview: thumbView belowSubview: caption];
    }
    return self;
}

@end
