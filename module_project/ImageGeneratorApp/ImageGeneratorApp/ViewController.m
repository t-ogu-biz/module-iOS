//
//  ViewController.m
//  ImageGeneratorApp
//
//  Created by 小口 哲史 on 2017/02/10.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleGenerateImageBtn:(id)sender {
    mView = [[View alloc] init];
    [self setMessage];
    UIImage *image = [self generateImage:mView];
    [imageView setImage:image];
    [self saveimage:image];
}

-(void)setMessage {
    mView.lable_title.text = @"伝送テスト";
    mView.label_date.text = @"2017/02/10";
    mView.label_location.text = @"渋谷";
    mView.textView_notices.text = @"一部動画の撮り方に不備あり";
}

- (UIImage *)generateImage:(UIView*)view {
    //必要なUIImageサイズ分のコンテキスト確保
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画像化する部分の位置を調整
    CGContextTranslateCTM(context, -view.frame.origin.x, -view.frame.origin.y);
    //画像出力
    [view.layer renderInContext:context];
    //imageオブジェクト作成
    UIImage *renderedImage = UIGraphicsGetImageFromCurrentImageContext();
    //コンテキスト破棄
    UIGraphicsEndImageContext();
    return renderedImage;
}

-(void)saveimage:(UIImage*)image {
    NSData *data = UIImageJPEGRepresentation(image, 0.8f);
    NSString *path = [NSString stringWithFormat:@"%@/sample.jpg",
                      [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
    if ([data writeToFile:path atomically:YES]) {
        NSLog(@"save OK");
    } else {
        NSLog(@"save NG");
    }
}


@end
