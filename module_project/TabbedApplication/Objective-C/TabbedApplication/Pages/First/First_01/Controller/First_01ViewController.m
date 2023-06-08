//
//  FirstViewController.m
//  TabbedApplication
//
//  Created by 小口哲史 on 2016/05/06.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import "First_01ViewController.h"
@interface First_01ViewController ()
@end
@implementation First_01ViewController
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
- (IBAction)handleSegueFirstFirstViewBtn:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotification:
     [NSNotification notificationWithName:LOCAL_NOTIFICATION_SUGUE_FIRST_02_VIEW object:nil]];
}


#pragma mark - 共通機能

@end
