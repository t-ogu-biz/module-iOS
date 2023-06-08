//
//  TableViewManager.h
//  TableView
//
//  Created by 小口哲史 on 2016/06/19.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewManager : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)NSArray *dataSource;

@end
