//
//  ScrollViewController.h
//  ScrollViewApp
//
//  Created by 小口 哲史 on 2017/02/22.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SizeManager.h"
#import "View.h"
#import "DataManager.h"
@interface ScrollViewController : UIViewController {
    View *section2View;
    NSArray *dataSource;
}

@property (weak, nonatomic) IBOutlet UIScrollView *sv;
@property (weak, nonatomic) IBOutlet UIView *section1View;
- (IBAction)handleChangeBtn:(id)sender;

@end
