//
//  UIDevice+Model.m
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "UIDevice+Model.h"
@implementation UIDevice (Model)
/*
 * 画面サイズ(インチ)を返却するメソッド
 *
 * @methodOf UIDevice+Model
 */
+(NSString *)getScreenSize {
    NSString *modelname = [[UIDevice currentDevice] model];
    if ( ![modelname hasPrefix:@"iPad"] ) {
        CGRect r = [[UIScreen mainScreen] bounds];
        //iPhone4、iPhone4S
        if(r.size.height == 480){
            modelname = @"3.5";
        //iPhone5、iPhone5S
        } else if(r.size.height == 568){
            modelname = @"4.0";
        //iPhone6、iPhone6S、iPhone7、iPhone7S
        } else if(r.size.height == 667){
            modelname = @"4.7";
        //iPhone6Plus、iPhone6SPlus、iPhone7Plus、iPhone7SPlus
        } else if(r.size.height == 736){
            modelname = @"5.5";
        //iPhoneX
        } else if (r.size.height == 812) {
            modelname = @"5.8";
        } else {
            modelname = @"4.0";
        }
    } else {
        modelname =  @"4.0";
    }
    return modelname;
}
@end
