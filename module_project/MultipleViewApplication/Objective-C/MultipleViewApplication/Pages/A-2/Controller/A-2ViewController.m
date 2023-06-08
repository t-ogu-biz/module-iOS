//
//  A-2ViewController.m
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/01/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "A-2ViewController.h"

@interface A_2ViewController ()

@end

@implementation A_2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SegueRootBtn:(id)sender {
    [[TransitionManager sharedEntry] otherControllersTransitionPush:self.navigationController identifier:CONTROLLER_B];
}

@end
