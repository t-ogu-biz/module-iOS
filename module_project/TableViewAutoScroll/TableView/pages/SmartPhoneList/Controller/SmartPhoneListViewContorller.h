//
//  SmartPhoneListViewContorller.h
//  TableView
//
//  Created by 小口哲史 on 2016/06/18.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SmartPhoneInfo.h"
#import "DataManager.h"
#import "SmartPhoneTableViewManager.h"
@interface SmartPhoneListViewContorller : UIViewController {
    IBOutlet UITableView *mTableView;
    NSArray *dataSource;
    SmartPhoneTableViewManager *tableViewManager;
}

- (IBAction)handleAutoScrollBtn:(id)sender;


@end
