//
//  View.h
//  XibApp
//
//  Created by 小口 哲史 on 2017/02/22.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SmartPhoneListViewCell.h"
#import "SmartPhoneInfo.h"
#import "DataManager.h"
#import "SizeManager.h"
@interface View : UIView<UITableViewDelegate,UITableViewDataSource> {
    //NSArray *dataSource;
}

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btn_select;
@property (weak, nonatomic) IBOutlet UILabel *lableList;
@property (strong, nonatomic) IBOutlet UITableView *list;

@property (strong,nonatomic) NSArray *dataSource;

//-(void)upDateTableView;
-(void)upDateTableView:(CGRect)fframe;
- (instancetype)initWithFrame:(CGFloat)x originy:(CGFloat)y sizeWidth:(CGFloat)widt;
@end
