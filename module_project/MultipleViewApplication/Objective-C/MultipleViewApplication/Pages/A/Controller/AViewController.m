//
//  AViewController.m
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/01/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

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

- (IBAction)segueA:(id)sender {
    [[TransitionManager sharedEntry] transitionPush:self.navigationController identifier:CONTROLLER_A_1];
}
@end
