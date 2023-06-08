//
//  ViewController.m
//  CalculateApp
//
//  Created by 小口 哲史 on 2017/03/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int all1 = 10;
    int result1 = all1 / 3;
    NSLog(@"計算結果:%d",result1);
    
    int all2 = 3;
    int result2 = all2 / 5;
    NSLog(@"計算結果:%d",result2);
    
    int all3 = 0;
    int result3 = all3 / 5;
    NSLog(@"計算結果:%d",result3);
    
    ma = [NSMutableArray array];
    int count = (int)[ma count];
    NSLog(@"データ数:%d",count);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
