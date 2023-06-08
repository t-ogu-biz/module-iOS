//
//  ViewController.h
//  MultipleViewApplication
//
//  Created by 小口 哲史 on 2017/01/24.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridViewManager.h"
#import "AViewController.h"
#import "TransitionManager.h"
@interface ViewController : UIViewController<GridViewManagerDelegate>{
    GridViewManager *gvm;
    IBOutlet UITableView *tableview;
}

@end

