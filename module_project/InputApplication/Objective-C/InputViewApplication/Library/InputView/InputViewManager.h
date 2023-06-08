//
//  InputViewManager.h
//
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InputViewCell.h"
#import "SizeManager.h"
#import "InputViewManagerManagerDelegate.h"
@interface InputViewManager : NSObject<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate> {
    UITextField *tf;
}

@property(nonatomic)NSArray *dataSource;
@property(nonatomic,weak)id<InputViewManagerManagerDelegate>delegate;
@property(nonatomic)UIViewController *mainCon;
@property(nonatomic)UITableView *tableview;

@end
