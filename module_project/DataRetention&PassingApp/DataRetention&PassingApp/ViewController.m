//
//  ViewController.m
//  DataRetention&PassingApp
//
//  Created by 小口 哲史 on 2017/02/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end
@implementation ViewController
@synthesize field_retentionString;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);
    // Do any additional setup after loading the view, typically from a nib.
    field_retentionString.text = @"こんにちはこんにちはこんにちはこん";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"retentionArray");
    if ([retentionArray count] == 0) {
        NSLog(@"retentionArray:データなし");
        retentionArray = [NSMutableArray array];
        [retentionArray addObject:@"01"];
        [retentionArray addObject:@"02"];
        [retentionArray addObject:@"03"];
        [retentionArray addObject:@"04"];
    } else {
        NSLog(@"retentionArray:データあり");
        NSLog(@"retentionArray:%@",retentionArray);
    }
    NSLog(@"retentionString");
    if (retentionString == nil) {
        NSLog(@"retentionString:データなし");
        retentionString = @"テスト";
    } else {
        NSLog(@"retentionString:データあり");
        NSLog(@"retentionString:%@",retentionString);
    }
     NSLog(@"retentionBool");
    if (!retentionBool) {
        NSLog(@"retentionBool:データなし");
        retentionBool = YES;
    } else {
         NSLog(@"retentionBool:データあり");
    }
    NSLog(@"入力データ:%@",field_retentionString.text);
}

/*
NSArray *retentionArray;
NSString *retentionString;
BOOL *retentionBool;
*/

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handleTransitionBtn:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AfterTransitionViewController *atvc = [storyboard instantiateViewControllerWithIdentifier:@"AfterTransitionViewController"];
    [self.navigationController pushViewController:atvc animated:YES];
    
}

- (IBAction)handleModalTransitionBtn:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AfterModalTransitionViewController *amtvc = [storyboard instantiateViewControllerWithIdentifier:@"AfterModalTransitionViewController"];
    [self presentViewController:amtvc animated:YES completion:nil];
}

@end
