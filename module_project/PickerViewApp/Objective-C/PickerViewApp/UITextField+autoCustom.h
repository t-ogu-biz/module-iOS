//
//  UITextField+autoCustom.h
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UITextField (autoCustom)

-(void)borderStyleNoneWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor radius:(CGFloat)radius fontSize:(CGFloat)fontSize textColor:(UIColor*)txtColor backgroundColor:(UIColor*)bgColor leftPadding:(CGFloat)leftPad;
@end
