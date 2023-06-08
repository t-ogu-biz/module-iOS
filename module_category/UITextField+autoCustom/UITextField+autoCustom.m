//
//  UITextField+autoCustom.m
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "UITextField+autoCustom.h"
@implementation UITextField (autoCustom)

/*
 * interfaceBuilderで定義したUITextFileオブジェクト(borderStyle:UITextBorderStyleNone)の見た目をカスタマイズするメソッド
 *
 * @param: {borderWidth} 枠線の幅
 * @param: {borderColor} 枠線の色
 * @param: {radius} 角の角度
 * @param: {txtColor} 入力の文字色
 * @param: {bgColor} 背景色
 * @param: {leftPad} 左隅の余白
 *
 * @methodOf UITextField+autoCustom
 */
-(void)borderStyleNoneWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor radius:(CGFloat)radius fontSize:(CGFloat)fontSize textColor:(UIColor*)txtColor backgroundColor:(UIColor*)bgColor leftPadding:(CGFloat)leftPad {
        if (borderWidth != 0) {
            self.layer.borderWidth = borderWidth;
        }
        if (borderColor != nil) {
            self.layer.borderColor = [borderColor CGColor];
        }
        if (radius != 0) {
            self.layer.cornerRadius = radius;
        }
        if (bgColor != nil) {
            self.backgroundColor = bgColor;
        }
        CGRect ltfPvframe;
        if (leftPad != 0) {
            ltfPvframe = CGRectMake(0,0,leftPad,self.frame.size.height);
        } else {
            ltfPvframe = CGRectMake(0,0,5,self.frame.size.height);
        }
    UIView *ltfPv = [[UIView alloc] initWithFrame:ltfPvframe];
    
    ltfPv.opaque = NO;
    
    self.leftView = ltfPv;
    
    self.leftViewMode = UITextFieldViewModeAlways;
    
        if (txtColor != nil) {
            self.textColor = txtColor;
        }
    
    if (fontSize != 0) {
            [self setFont:[UIFont systemFontOfSize:fontSize]];
        }
    self.textAlignment = NSTextAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.adjustsFontSizeToFitWidth = NO;
}

@end
