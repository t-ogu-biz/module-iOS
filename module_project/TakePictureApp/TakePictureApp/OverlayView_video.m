//
//  OverlayView_video.m
//  TakePictureApp
//
//  Created by 小口 哲史 on 2017/02/13.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "OverlayView_video.h"

@implementation OverlayView_video

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UINib *nib = [UINib nibWithNibName:@"OverlayView_video" bundle:nil];
        self = [nib instantiateWithOwner:nil options:nil][0];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        UINib *nib = [UINib nibWithNibName:@"OverlayView_video" bundle:nil];
        self = [nib instantiateWithOwner:nil options:nil][0];
    }
    return self;
}


@end
