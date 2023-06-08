//
//  FirstFirstViewController.m
//  TabbedApplication
//
//  Created by 小口哲史 on 2016/06/05.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import "Second_01ViewController.h"
@interface Second_01ViewController ()
@end
@implementation Second_01ViewController
#pragma mark - 初期化機能関連
- (void)viewDidLoad {
    [super viewDidLoad];
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
}


#pragma mark - アクション対応機能関連


#pragma mark - 共通機能
- (IBAction)handleSegueSecond_02ViewBtn:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotification:
     [NSNotification notificationWithName:LOCAL_NOTIFICATION_SUGUE_SECOND_02_VIEW object:nil]];
}


@end
