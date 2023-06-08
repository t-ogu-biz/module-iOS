//
//  SizeManager.h
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/01/25.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIDevice+Model.h"
#define BASE_SCREEN_SIZE @"4.0"
#define BASE_SCREEN_SIZE_AREA 181760
#define BASE_SCREEN_SIZE_HEIGHT 568

#define SCREEN_SIZE_4S @"3.5"
#define SCREEN_SIZE_5S @"4.0"
#define SCREEN_SIZE_7S @"4.7"
#define SCREEN_SIZE_7SPlus @"5.5"


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
+(CGFloat)getFontSize:(CGFloat)fontSize;
+(UIFont*)getFont:(CGFloat)fontSize;
+(CGFloat)getObjectSizeHeight:(CGFloat)height;

@end
