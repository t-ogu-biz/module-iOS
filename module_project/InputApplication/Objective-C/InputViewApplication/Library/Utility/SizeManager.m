//
//  SizeManager.m
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "SizeManager.h"

@implementation SizeManager

+(float)getScreenSizeHeight {
    float statusbar =  [[UIApplication sharedApplication] statusBarFrame].size.height;
    float app = [[UIScreen mainScreen] applicationFrame].size.height;
    return statusbar + app;
}

+(float)getAppSizeHeight {
    return [[UIScreen mainScreen] applicationFrame].size.height;
}

+(float)getNaviConAppSizeHeight:(UIViewController*)controller {
    float app = [[UIScreen mainScreen] applicationFrame].size.height;
    float navigation =  controller.navigationController.navigationBar.frame.size.height;
    return app - navigation;
}

@end
