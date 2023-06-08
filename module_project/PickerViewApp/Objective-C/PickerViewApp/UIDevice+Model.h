//
//  UIDevice+Model.h
//  TextFieldAutoCustomApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>

#import <sys/utsname.h>
#import <sys/sysctl.h>

 @interface UIDevice (Model)

+ (NSString *)getScreenSize ;

@end
