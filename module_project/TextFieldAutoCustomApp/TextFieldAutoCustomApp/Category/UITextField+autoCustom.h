//
//  UITextField+autoCustom.h
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2017/02/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIDevice+Model.h"
@interface UITextField (autoCustom)

-(void)borderStyleNone:(CGFloat)borderWidth borderColor:(UIColor*)borderColor radius:(CGFloat)radius fontSize:(CGFloat)fontSize;

@end
