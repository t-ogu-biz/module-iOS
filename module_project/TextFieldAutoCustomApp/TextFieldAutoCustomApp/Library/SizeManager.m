//
//  SizeManager.m
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "SizeManager.h"
@implementation SizeManager

+(float)getScreenSizeHeight {
    float statusbar =  [[UIApplication sharedApplication] statusBarFrame].size.height;
    float app = [[UIScreen mainScreen] applicationFrame].size.height;
    return statusbar + app;
}

+(float)getAppSizeHeight {
    return [[UIScreen mainScreen] applicationFrame].size.height;
}

+(float)getNaviConAppSizeHeight:(UIViewController*)controller {
    float app = [[UIScreen mainScreen] applicationFrame].size.height;
    float navigation =  controller.navigationController.navigationBar.frame.size.height;
    return app - navigation;
}

+(CGFloat)getFontSize:(UITextField*)tf {
    CGFloat f = tf.font.pointSize;
    NSLog(@"基本フォントサイズ%f",f);
    NSString *currentSize = [UIDevice getScreenSize];
    CGFloat resize;
        if ([currentSize isEqualToString: BASE_SCREEN_SIZE]) {
            resize = f;
        } else {
            CGRect r = [[UIScreen mainScreen] bounds];
            CGFloat currentSizeArea = r.size.height * r.size.width;
            NSLog(@"デバイスサイズ%f",currentSizeArea);
            float magnification = currentSizeArea / BASE_SCREEN_SIZE_AREA;
            NSLog(@"倍率%f",magnification);
            resize = f * magnification * 0.90;
            NSLog(@"補正フォントサイズ%f",resize);
        }
    UIFont *font = [UIFont systemFontOfSize:resize];
    return font.pointSize;
}

@end
