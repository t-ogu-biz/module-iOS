//
//  UITextField+autoCustom.m
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "UITextField+autoCustom.h"
@implementation UITextField (autoCustom)

-(void)borderStyleNone:(CGFloat)borderWidth borderColor:(UIColor*)borderColor radius:(CGFloat)radius fontSize:(CGFloat)fontSize {
    self.borderStyle = UITextBorderStyleNone;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = radius;
    self.layer.borderColor = [borderColor CGColor];
    UIView *ltfPv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    ltfPv.opaque = NO;
    ltfPv.backgroundColor = [UIColor clearColor];
    self.leftView = ltfPv;
    self.leftViewMode = UITextFieldViewModeAlways;
    [self setFont:[UIFont systemFontOfSize:fontSize]];
    self.adjustsFontSizeToFitWidth = NO;
    self.textAlignment = NSTextAlignmentLeft;
}

@end
