//
//  ViewController.m
//  MBProgressHUDApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize progressShowView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handleProgressShowBtn:(id)sender {
    mph = [[MBProgressHUD alloc] initWithView:self.view];
    mph.labelText = @"テスト";
    mph.detailsLabelText = @"メッセージ1";
    mph.animationType = MBProgressHUDAnimationZoomOut;
    [progressShowView addSubview:mph];
    [mph show:YES];
}

- (IBAction)handleProgressChangeMessageBtn:(id)sender {
    if (!mph) {
        return;
    }
    mph.labelText = @"テスト";
    mph.detailsLabelText = @"メッセージ2";
}

- (IBAction)handleHiddenProgressBtn:(id)sender {
    if (!mph) {
        return;
    }
    [mph hide:YES];
    mph = nil;
}
@end
