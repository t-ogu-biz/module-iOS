//
//  ViewController.h
//  PickerViewApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+autoCustom.h"
#import "SizeManager.h"
@interface ViewController : UIViewController<UITextFieldDelegate> {
    UIDatePicker *timePicker;
    NSString *selectedTime;
}


@property (weak, nonatomic) IBOutlet UITextField *tf_test;

@end

