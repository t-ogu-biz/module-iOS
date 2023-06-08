//
//  ViewController.h
//  DataRetention&PassingApp
//
//  Created by 小口 哲史 on 2017/02/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterTransitionViewController.h"
#import "AfterModalTransitionViewController.h"

@interface ViewController : UIViewController {
    NSMutableArray *retentionArray;
    NSString *retentionString;
    BOOL retentionBool;
}

- (IBAction)handleTransitionBtn:(id)sender;
- (IBAction)handleModalTransitionBtn:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *field_retentionString;

@end

