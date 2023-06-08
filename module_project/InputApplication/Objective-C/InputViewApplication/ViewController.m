//
//  ViewController.m
//  InputViewApplication
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ivm = [[InputViewManager alloc] init];
    tableview.delegate = ivm;
    tableview.dataSource = ivm;
    ivm.tableview = tableview;
    ivm.tableview.scrollEnabled = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
