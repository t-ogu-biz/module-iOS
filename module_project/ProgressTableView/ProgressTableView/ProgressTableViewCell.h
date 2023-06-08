//
//  ProgressTableViewCell.h
//  TableView
//
//  Created by 小口 哲史 on 2017/03/02.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ProgressTableViewCell : UITableViewCell
/*
@property (strong, nonatomic) IBOutlet UIImageView *ImgView_device;
@property (strong, nonatomic) IBOutlet UILabel *lable_name;
@property (strong, nonatomic) IBOutlet UILabel *label_marker;
@property (strong, nonatomic) IBOutlet UILabel *label_weight;
@property (strong, nonatomic) IBOutlet UILabel *label_deviceSize;
@property (strong, nonatomic) IBOutlet UILabel *label_displaySize;
@property (strong, nonatomic) IBOutlet UILabel *label_spec;
*/
@property (strong, nonatomic) IBOutlet UIProgressView *progress;

+(ProgressTableViewCell*)cellFromNibNamed:(NSString*)nibName;

@end
