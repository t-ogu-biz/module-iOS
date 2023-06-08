//
//  InputViewCell.h
//
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface InputViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label_firstName;
@property (strong, nonatomic) IBOutlet UITextField *field_firstName;
@property (strong, nonatomic) IBOutlet UILabel *label_lastName;
@property (strong, nonatomic) IBOutlet UITextField *field_lastName;
@property (strong, nonatomic) IBOutlet UILabel *label_sheet1;
@property (strong, nonatomic) IBOutlet UITextField *field_sheet1;
@property (strong, nonatomic) IBOutlet UILabel *label_sheet2;
@property (strong, nonatomic) IBOutlet UITextField *field_sheet2;
@property (strong, nonatomic) IBOutlet UILabel *label_city;
@property (strong, nonatomic) IBOutlet UITextField *field_city;
@property (strong, nonatomic) IBOutlet UILabel *label_state;
@property (strong, nonatomic) IBOutlet UITextField *field_state;
@property (strong, nonatomic) IBOutlet UILabel *lable_zipCode;
@property (strong, nonatomic) IBOutlet UITextField *field_zipCode;
@property (strong, nonatomic) IBOutlet UILabel *label_email;
@property (strong, nonatomic) IBOutlet UITextField *field_email;
@property (strong, nonatomic) IBOutlet UILabel *label_phone;
@property (strong, nonatomic) IBOutlet UITextField *fielf_phone;

+(InputViewCell*)cellFromNibNamed:(NSString*)nibName;

@end
