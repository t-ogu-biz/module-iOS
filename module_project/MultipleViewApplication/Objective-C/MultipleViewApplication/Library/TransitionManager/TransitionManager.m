//
//  TransitionManager.m
//
//
//  Created by 小口哲史 on 2017/01/27.
//  Copyright (c) 2017年 akuraru. All rights reserved.
//

#import "TransitionManager.h"

@implementation TransitionManager {
    UIStoryboard *main;
}

+ (instancetype)sharedEntry {
    static id _sharedEntry = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedEntry = self.new;
    });
    return _sharedEntry;
}

- (id)init {
    self = [super init];
        if (self) {
            main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        }
    return self;
}

- (id)getVC:(NSString *)identifier {
    return [main instantiateViewControllerWithIdentifier:identifier];
}

- (void)transitionPush:(UINavigationController *)nc identifier:(NSString*)identifier {
    [nc pushViewController:[self getVC:identifier] animated:YES];
}

- (void)otherControllersTransitionPush:(UINavigationController *)nc identifier:(NSString*)identifier {
    [nc popToRootViewControllerAnimated:NO];
    [nc pushViewController:[self getVC:identifier] animated:NO];
}

@end
