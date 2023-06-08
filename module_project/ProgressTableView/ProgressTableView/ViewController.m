//
//  ViewController.m
//  ProgressTableView
//
//  Created by 小口 哲史 on 2017/03/02.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController
@synthesize tb;
- (void)viewDidLoad {
    [super viewDidLoad];
    ptvm = [[ProgressTableViewManager alloc] init];
    tb.delegate = ptvm;
    tb.dataSource = ptvm;
    
    NSMutableArray *data = [NSMutableArray array];
    NSNumber *num1 = [NSNumber numberWithFloat:0.1];
    CellInfo *cell_01 = [CellInfo alloc];
    cell_01.rate = num1;
    [data addObject:cell_01];
    
    NSNumber *num2 = [NSNumber numberWithFloat:0.2];
    CellInfo *cell_02 = [CellInfo alloc];
    cell_02.rate = num2;
    [data addObject:cell_02];
    
    NSNumber *num3 = [NSNumber numberWithFloat:0.3];
    CellInfo *cell_03 = [CellInfo alloc];
    cell_03.rate = num3;
    [data addObject:cell_03];
    
    NSNumber *num4 = [NSNumber numberWithFloat:0.4];
    CellInfo *cell_04 = [CellInfo alloc];
    cell_04.rate = num4;
    [data addObject:cell_04];
    
    NSNumber *num5 = [NSNumber numberWithFloat:0.5];
    CellInfo *cell_05 = [CellInfo alloc];
    cell_05.rate = num5;
    [data addObject:cell_05];
    
    NSNumber *num6 = [NSNumber numberWithFloat:0.6];
    CellInfo *cell_06 = [CellInfo alloc];
    cell_06.rate = num6;
    [data addObject:cell_06];
    
    NSNumber *num7 = [NSNumber numberWithFloat:0.7];
    CellInfo *cell_07 = [CellInfo alloc];
    cell_07.rate = num7;
    [data addObject:cell_07];
    
    NSNumber *num8 = [NSNumber numberWithFloat:0.8];
    CellInfo *cell_08 = [CellInfo alloc];
    cell_08.rate = num8;
    [data addObject:cell_08];
    
    NSNumber *num9 = [NSNumber numberWithFloat:0.9];
    CellInfo *cell_09 = [CellInfo alloc];
    cell_09.rate = num9;
    [data addObject:cell_09];
    
    NSNumber *num10 = [NSNumber numberWithFloat:1.0];
    CellInfo *cell_10 = [CellInfo alloc];
    cell_10.rate = num10;
    [data addObject:cell_10];
    
    ptvm.dataSource = data;
    [tb reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)handleUpdateCellBtn:(id)sender {
    /*
    NSMutableArray *data = [NSMutableArray array];
    NSNumber *num1 = [NSNumber numberWithFloat:1.0];
    [data addObject:num1];
    NSNumber *num2 = [NSNumber numberWithFloat:0.9];
    [data addObject:num2];
    NSNumber *num3 = [NSNumber numberWithFloat:0.8];
    [data addObject:num3];
    NSNumber *num4 = [NSNumber numberWithFloat:0.7];
    [data addObject:num4];
    NSNumber *num5 = [NSNumber numberWithFloat:0.6];
    [data addObject:num5];
    NSNumber *num6 = [NSNumber numberWithFloat:0.5];
    [data addObject:num6];
    NSNumber *num7 = [NSNumber numberWithFloat:0.4];
    [data addObject:num7];
    NSNumber *num8 = [NSNumber numberWithFloat:0.3];
    [data addObject:num8];
    NSNumber *num9 = [NSNumber numberWithFloat:0.2];
    [data addObject:num9];
    NSNumber *num10 = [NSNumber numberWithFloat:0.1];
    [data addObject:num10];
    */
    //[tb reloadData];
    NSNumber *num01 = [NSNumber numberWithFloat:1.0];
    CellInfo *cell_01 = [CellInfo alloc];
    cell_01.rate = num01;
    [ptvm.dataSource replaceObjectAtIndex:0 withObject:cell_01];
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    [tb reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationNone];
    /*
    for(int i=0; i<4; i++){
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        [tb reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationNone];
    }
    */
}


@end
