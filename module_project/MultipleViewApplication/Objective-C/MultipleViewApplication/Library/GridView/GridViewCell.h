//
//  GridViewCell.h
//
//
//  Created by 小口哲史 on 2017/01/24.
//  Copyright © 2017年 yourCompany. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface GridViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *img_home_A;
@property (strong, nonatomic) IBOutlet UIImageView *img_home_B;
@property (strong, nonatomic) IBOutlet UIImageView *img_home_C;
@property (strong, nonatomic) IBOutlet UIImageView *img_home_D;
@property (strong, nonatomic) IBOutlet UIImageView *img_home_E;

+(GridViewCell*)cellFromNibNamed:(NSString*)nibName;

@end
