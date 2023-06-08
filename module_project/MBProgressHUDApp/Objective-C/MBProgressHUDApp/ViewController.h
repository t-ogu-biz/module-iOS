//
//  ViewController.h
//  MBProgressHUDApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ViewController : UIViewController {
    MBProgressHUD *mph;
}

@property (strong, nonatomic) IBOutlet UIView *progressShowView;
- (IBAction)handleProgressShowBtn:(id)sender;
- (IBAction)handleProgressChangeMessageBtn:(id)sender;
- (IBAction)handleHiddenProgressBtn:(id)sender;


/*
@property (strong, nonatomic) IBOutlet UIView *progressShowView;
@property (strong, nonatomic) IBOutlet UIButton *handleProgressShowBtn;
@property (strong, nonatomic) IBOutlet UIButton *handleHiddenProgressBtn;
@property (strong, nonatomic) IBOutlet UIButton *handleProgressChangeMessageBtn;
*/

@end

