//
//  NSStringUtil.m
//
//  Created by 小口 哲史 on 13/02/16.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import "NSStringUtil.h"

@implementation NSStringUtil

+(BOOL)isNullorEmpty:(NSString *)text{
    if ([@"" isEqualToString:text] || !text || [@"<null>" isEqualToString:text] || [text isEqual:[NSNull null]]) {
        return true;
    }
    return false;
}

@end
