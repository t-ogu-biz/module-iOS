//
//  ViewController.m
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/01/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    gvm = [[GridViewManager alloc] init];
    gvm.mainCon = self;
    gvm.delegate = self;
    tableview.delegate = gvm;
    tableview.dataSource = gvm;
    tableview.scrollEnabled = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleA {
    [[TransitionManager sharedEntry] transitionPush:self.navigationController identifier:CONTROLLER_A];
}

-(void)handleB {
    [[TransitionManager sharedEntry] transitionPush:self.navigationController identifier:CONTROLLER_B];
}


@end
