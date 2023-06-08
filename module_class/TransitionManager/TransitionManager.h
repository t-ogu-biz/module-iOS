//
//  TransitionManager.h
//
//
//  Created by 小口 哲史 on 2017/01/27.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define CONTROLLER_A @"AViewController"
#define CONTROLLER_A_1 @"A_1ViewController"
#define CONTROLLER_A_2 @"A_2ViewController"
#define CONTROLLER_B @"BViewController"
@interface TransitionManager : NSObject

+ (instancetype)sharedEntry;

- (void)transitionPush:(UINavigationController *)controller identifier:(NSString*)identifier;
- (void)otherControllersTransitionPush:(UINavigationController *)nc identifier:(NSString*)identifier;

@end
