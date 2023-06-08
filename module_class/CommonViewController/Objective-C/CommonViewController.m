//
//  CommonViewController.m
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "CommonViewController.h"
@implementation CommonViewController

#pragma mark - UIViewControllerのメソッド
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self defineNavigationBarColor];
    weakSelf = self;
        if (self.onViewDidLoadBlock) {
            self.onViewDidLoadBlock(weakSelf);
        }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    AppDelegate *appDelegate = APP_DELEGATE;
        if (!self.nonFrontViewControllerFlag) {
            appDelegate.frontOfViewController = [self class];
        }
    //[self defineNavigationBarColor];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //[self defineNavigationBarColor];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self dismissIndicator];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - プログレス表示関連
-(void)showIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)dismissIndicator {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)showMBProgress:(NSString*)title {
        if (_mbProgressHUD) {
            [_mbProgressHUD hide:YES];
            _mbProgressHUD = nil;
        }
    _mbProgressHUD = [[MBProgressHUD alloc] initWithView:self.view];
    _mbProgressHUD.labelText = title;
    _mbProgressHUD.animationType = MBProgressHUDAnimationZoomOut;
    [self.view addSubview:_mbProgressHUD];
    [_mbProgressHUD show:YES];
}

-(void)updateMBProgressTitle:(NSString*)title {
        if (!_mbProgressHUD) {
            return;
        }
    _mbProgressHUD.labelText = title;
}

-(void)dismissMBProgress {
        if (!_mbProgressHUD) {
            return;
        }
    [_mbProgressHUD hide:YES];
    _mbProgressHUD = nil;
}

-(void)addRefreshControlWithTableView:(UITableView*)tableView {
    mRefreshControl = [[UIRefreshControl alloc] init];
    [mRefreshControl addTarget:self action:@selector(onTableViewRefreshed) forControlEvents:UIControlEventValueChanged];
    [tableView addSubview:mRefreshControl];
}

-(void)endRefreshing {
    if (mRefreshControl) {
        [mRefreshControl endRefreshing];
    }
}

-(void)onTableViewRefreshed;{
    // 継承先でOverrideして使用する.
}


#pragma mark - チェックイン処理
-(void)defineNavigationBarColor {
    self.navigationController.navigationBar.barTintColor =[UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor hexToUIColor:@"007AFF" alpha:1.0];
}

-(void)transitionTo:(CommonViewController *)viewController {
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            viewController.edgesForExtendedLayout = UIRectEdgeNone;
        }
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    naviController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    
    [self presentViewController:naviController animated:YES completion:nil];
}

-(void)closeBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//継承先のViewControllerを最前面のViewControllerとして定義しない場合に呼び出す
-(void)defineThisClassNotFrontViewController {
    self.nonFrontViewControllerFlag = YES;
}

  
@end
