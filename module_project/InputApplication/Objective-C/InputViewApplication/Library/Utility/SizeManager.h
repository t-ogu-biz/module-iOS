//
//  SizeManager.h
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SizeManager : NSObject

+(float)getScreenSizeHeight;
+(float)getAppSizeHeight;
+(float)getNaviConAppSizeHeight:(UIViewController*)controller;

@end
