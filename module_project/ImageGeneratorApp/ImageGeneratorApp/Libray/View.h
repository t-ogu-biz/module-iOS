

//
//  View.h
//
//  Created by 小口 哲史 on 2017/02/10.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface View : UIView {}

@property (strong, nonatomic) IBOutlet UILabel *lable_title;
@property (strong, nonatomic) IBOutlet UILabel *label_date;
@property (strong, nonatomic) IBOutlet UILabel *label_location;
@property (strong, nonatomic) IBOutlet UITextView *textView_notices;

- (id)initWithFrame:(CGRect)frame;



@end
