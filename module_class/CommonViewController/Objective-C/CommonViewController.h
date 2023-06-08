//
//  CommonViewController.h
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "UIColor+Hex.h"
#import "NSStringUtil.h"
#import "TransitionManager.h"
#import "SizeManager.h"
#import "UITextField+autoCustom.h"
@interface CommonViewController : UIViewController {
    UIRefreshControl *mRefreshControl;
    MBProgressHUD *_mbProgressHUD;
    UIAlertView *_indicatorDialogAlert;
    __unsafe_unretained id weakSelf;
}

typedef void (^TransitionOnViewDidLoadBlock)(CommonViewController *controller);
@property(nonatomic,weak)TransitionOnViewDidLoadBlock onViewDidLoadBlock;
@property (nonatomic)BOOL nonFrontViewControllerFlag;

-(void)showIndicator;
-(void)dismissIndicator;
-(void)showMBProgress:(NSString*)title;
-(void)dismissMBProgress;
-(void)addRefreshControlWithTableView:(UITableView*)tableView;
-(void)addRefreshControlWithCoverageSummaryTableView:(UITableView*)tableView;
-(void)endRefreshing;
-(void)onTableViewRefreshed;
-(void)defineNavigationBarColor;
-(void)transitionTo:(CommonViewController *)viewController;
-(void)closeBtnClicked:(id)sender;
-(void)defineThisClassNotFrontViewController;
-(void)updateMBProgressTitle:(NSString*)title;

@end
