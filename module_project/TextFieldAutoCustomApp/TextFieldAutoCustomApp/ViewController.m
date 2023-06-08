//
//  ViewController.m
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tf;
- (void)viewDidLoad {
    [super viewDidLoad];
    [tf borderStyleNone:0.5f borderColor:[UIColor blackColor] radius:5.0f fontSize:[SizeManager getFontSize:tf]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)getFontSize {
    CGFloat f = tf.font.pointSize;
    NSLog(@"基本フォントサイズ%f",f);
    NSString *size = [UIDevice getScreenSize];
    CGFloat resize;
    if ([size isEqualToString: BASE_SCREEN_SIZE]) {
        resize = f;
    } else {
        CGRect r = [[UIScreen mainScreen] bounds];
        CGFloat size = r.size.height * r.size.width;
        NSLog(@"デバイスサイズ%f",size);
        float magnification = size / BASE_SCREEN_SIZE_AREA;
        NSLog(@"倍率%f",magnification);
        resize = f * magnification;
        resize = resize * 0.90;
        NSLog(@"補正フォントサイズ%f",resize);
    }
    return  [UIFont systemFontOfSize:resize].pointSize;
}


@end
