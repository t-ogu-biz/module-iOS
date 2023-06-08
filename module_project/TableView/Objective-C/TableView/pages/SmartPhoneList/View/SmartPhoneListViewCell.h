//
//  SmartPhoneListViewCell.h
//  TableView
//
//  Created by 小口哲史 on 2016/06/18.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface SmartPhoneListViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *ImgView_device;
@property (strong, nonatomic) IBOutlet UILabel *lable_name;
@property (strong, nonatomic) IBOutlet UILabel *label_marker;
@property (strong, nonatomic) IBOutlet UILabel *label_weight;
@property (strong, nonatomic) IBOutlet UILabel *label_deviceSize;
@property (strong, nonatomic) IBOutlet UILabel *label_displaySize;
@property (strong, nonatomic) IBOutlet UILabel *label_spec;

+(SmartPhoneListViewCell*)cellFromNibNamed:(NSString*)nibName;

@end
