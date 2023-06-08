//
//  SmartPhoneListViewContorller.m
//  TableView
//
//  Created by 小口哲史 on 2016/06/18.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import "SmartPhoneListViewContorller.h"
@interface SmartPhoneListViewContorller ()
@end
@implementation SmartPhoneListViewContorller

#pragma mark - 初期化機能関連
- (void)viewDidLoad {
    [super viewDidLoad];
    tableViewManager = [[SmartPhoneTableViewManager alloc] init];
    tableViewManager.dataSource = [DataManager getSmartPhoneInfo];
    mTableView.delegate = tableViewManager;
    mTableView.dataSource = tableViewManager;
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


#pragma mark - 終了機能関連
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleAutoScrollBtn:(id)sender {
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    [mTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

@end
