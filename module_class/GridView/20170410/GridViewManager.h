//
//  GridViewManager.h
//
//
//  Created by 小口哲史 on 2017/01/24.
//  Copyright © 2017年 yourCompany. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GridViewCell.h"
#import "SizeManager.h"
#import "GridViewManagerDelegate.h"
@interface GridViewManager : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)NSArray *dataSource;
@property(nonatomic,weak)id<GridViewManagerDelegate>delegate;
@property(nonatomic)UIViewController *mainCon;

@end
