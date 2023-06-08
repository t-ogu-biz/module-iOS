//
//  SizeManager.m
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//
#import "SizeManager.h"
@implementation SizeManager

/*
 * 画面の高さを返却するメソッド(ステータスバー + コンテンツ)
 *
 * @methodOf SizeManager
 */
+(float)getScreenSizeHeight {
    float statusbar =  [[UIApplication sharedApplication] statusBarFrame].size.height;
    float app = [[UIScreen mainScreen] applicationFrame].size.height;
    return statusbar + app;
}

/*
 * 画面の高さを返却するメソッド(コンテンツのみ)
 *
 * @methodOf SizeManager
 */
+(float)getAppSizeHeight {
    return [[UIScreen mainScreen] applicationFrame].size.height;
}

/*
 * 画面の高さを返却するメソッド(ナビゲーションバーを引いたもの)
 *
 * @param: {controller} 呼び出し元のViewController
 * @methodOf SizeManager
 */
+(float)getNaviConAppSizeHeight:(UIViewController*)controller {
    float app = [[UIScreen mainScreen] applicationFrame].size.height;
    float navigation =  controller.navigationController.navigationBar.frame.size.height;
    return app - navigation;
}

/*
 * 複数画面対応_文字サイズを返却するメソッド
 *
 * @param: {fontSize} interfaceBuilderで指定した基準の文字サイズ
 * @methodOf SizeManager
 */
+(CGFloat)getFontSize:(CGFloat)fontSize {
    NSString *currentSize = [UIDevice getScreenSize];
    CGFloat resize;
        if ([currentSize isEqualToString:BASE_SCREEN_SIZE]) {
            resize = fontSize;
        } else {
            CGRect r = [[UIScreen mainScreen] bounds];
            CGFloat currentSizeArea = r.size.height * r.size.width;
            float magnification = currentSizeArea / BASE_SCREEN_SIZE_AREA;
            resize = fontSize * magnification * 0.80;
        }
    UIFont *font = [UIFont systemFontOfSize:resize];
    return font.pointSize;
}

/*
 * 複数画面対応_オブジェクト:UIFontを返却するメソッド
 *
 * @param: {fontSize} interfaceBuilderで指定した基準の文字サイズ
 * @methodOf SizeManager
 */
+(UIFont*)getFont:(CGFloat)fontSize {
    NSString *currentSize = [UIDevice getScreenSize];
    CGFloat resize;
        if ([currentSize isEqualToString: BASE_SCREEN_SIZE]) {
            resize = fontSize;
        } else {
            CGRect r = [[UIScreen mainScreen] bounds];
            CGFloat currentSizeArea = r.size.height * r.size.width;
            float magnification = currentSizeArea / BASE_SCREEN_SIZE_AREA;
            resize = fontSize * magnification * 0.80;
        }
    return [UIFont systemFontOfSize:resize];
}

/*
 * 複数画面対応_オブジェクトの高さを返却するメソッド
 *
 * @param: {height} interfaceBuilderで指定した基準の高さ
 * @methodOf SizeManager
 */
+(CGFloat)getObjectSizeHeight:(CGFloat)height {
    NSString *currentSize = [UIDevice getScreenSize];
    CGFloat resize;
    if ([currentSize isEqualToString: BASE_SCREEN_SIZE]) {
        resize = height;
    } else {
        CGRect r = [[UIScreen mainScreen] bounds];
        CGFloat currentSizeHeight = r.size.height;
        float magnification = currentSizeHeight / BASE_SCREEN_SIZE_HEIGHT;
        resize = height * magnification * 1.0;
    }
    return resize;
}

@end

