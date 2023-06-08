//
//  ViewController.h
//  ProgressTableView
//
//  Created by 小口 哲史 on 2017/03/02.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressTableViewManager.h"
#import "ProgressTableViewCell.h"
#import "CellInfo.h"
@interface ViewController : UIViewController {
    ProgressTableViewManager *ptvm;
}

@property (strong, nonatomic) IBOutlet UITableView *tb;

- (IBAction)handleUpdateCellBtn:(id)sender;

@end

