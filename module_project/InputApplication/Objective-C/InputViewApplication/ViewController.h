//
//  ViewController.h
//  InputViewApplication
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewManager.h"
@interface ViewController : UIViewController {
    InputViewManager *ivm;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

