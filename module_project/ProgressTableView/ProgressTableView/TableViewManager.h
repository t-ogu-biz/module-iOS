//
//  TableViewManager.h
//  TableView
//
//  Created by 小口 哲史 on 2017/03/02.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewManager : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)NSArray *dataSource;

@end
