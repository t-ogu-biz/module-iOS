//
//  SizeManager.h
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/02/22.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIDevice+Model.h"
#define BASE_SCREEN_SIZE @"4.0"
#define BASE_SCREEN_SIZE_AREA 181760
#define BASE_SCREEN_SIZE_HEIGHT 568
/*SIZE
 ◼︎iPHone5
 inch: 4.0
 area: 320x568=181760
 
 ◼︎iPHone6、iPhone7
 inch: 4.7
 area: 375x667=250125
 
 ◼︎iPHone6Plus、iPhone7Plus
 inch: 5.5
 area: 414x736=304704
 */
@interface SizeManager : NSObject

+(float)getScreenSizeHeight;
+(float)getAppSizeHeight;
+(float)getNaviConAppSizeHeight:(UIViewController*)controller;
+(CGFloat)getFontSize:(UITextField*)tf;
+(CGFloat)getObjectSizeHeight:(CGFloat)height;
@end
