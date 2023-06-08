//
//  MuiltFunctionTabBarController.m
//  TabbedApplication
//
//  Created by 小口哲史 on 2016/06/05.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import "MuiltFunctionTabBarController.h"
@interface MuiltFunctionTabBarController ()
@end
@implementation MuiltFunctionTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
    [notificationCenter addObserver:self selector:@selector(seguefirst02View) name:LOCAL_NOTIFICATION_SUGUE_FIRST_02_VIEW object:nil];
    [notificationCenter addObserver:self selector:@selector(segueSecond02View) name:LOCAL_NOTIFICATION_SUGUE_SECOND_02_VIEW object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)seguefirst02View {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    First_02ViewController *first_02ViewCon = [storyboard instantiateViewControllerWithIdentifier:@"First_02ViewController"];
    
    self.selectedIndex = 0;
    [(UINavigationController*)[self.viewControllers objectAtIndex:0]
     pushViewController:first_02ViewCon animated:YES];
}

-(void)segueSecond02View {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Second_02ViewController *second_02ViewCon = [storyboard instantiateViewControllerWithIdentifier:@"Second_02ViewController"];
    self.selectedIndex = 1;
    [(UINavigationController*)[self.viewControllers objectAtIndex:1]
     pushViewController:second_02ViewCon animated:YES];
}

@end
