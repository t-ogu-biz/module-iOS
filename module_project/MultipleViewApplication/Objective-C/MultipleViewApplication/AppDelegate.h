//
//  AppDelegate.h
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/01/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;


@end

