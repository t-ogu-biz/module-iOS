//
//  NSStringUtil.h
//
//  Created by 小口 哲史 on 13/02/16.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSStringUtil : NSObject

// 空文字かnilの場合はtrueを返す
+(BOOL)isNullorEmpty:(NSString*)text;

@end
