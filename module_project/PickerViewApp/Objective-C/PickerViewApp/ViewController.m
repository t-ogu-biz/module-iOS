//
//  ViewController.m
//  PickerViewApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController
@synthesize tf_test;

- (void)viewDidLoad {
    [super viewDidLoad];
    //撮影時間入力フィールド
    tf_test.delegate = self;
    
    [tf_test borderStyleNoneWithBorderWidth:1.0f borderColor:nil radius:5.5f  fontSize:[SizeManager getFontSize:tf_test.font.pointSize] textColor:nil backgroundColor:nil leftPadding:0.0f];

    //時間選択ピッカー
    timePicker = [[UIDatePicker alloc]init];
    [timePicker setDatePickerMode:UIDatePickerModeTime];
    [timePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ja"]];
    [timePicker addTarget:self action:@selector(updateTextTime:) forControlEvents:UIControlEventValueChanged];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *twothDate = [dateFormatter dateFromString:@"0:00"];
    [timePicker setDate:twothDate];
    
    tf_test.text = @"00:00";
    tf_test.inputView = timePicker;
    
    selectedTime = @"00:00";
    
    //時間選択ピッカーのToolBarビュー
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIToolbar *keyboardDoneButtonView_time = [[UIToolbar alloc] init];
    keyboardDoneButtonView_time.barStyle  = UIBarStyleBlack;
    keyboardDoneButtonView_time.translucent = YES;
    keyboardDoneButtonView_time.tintColor = nil;
    [keyboardDoneButtonView_time sizeToFit];
    UIBarButtonItem *timeDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"完了" style:UIBarButtonItemStyleBordered target:self action:@selector(timePickerDoneClicked)];
    UIBarButtonItem *timeCancelButton = [[UIBarButtonItem alloc] initWithTitle:@"キャンセル" style:UIBarButtonItemStyleBordered target:self action:@selector(timePickerCancelClicked)];
    [keyboardDoneButtonView_time setItems:[NSArray arrayWithObjects:timeCancelButton, spacer, timeDoneButton, nil]];
    tf_test.inputAccessoryView = keyboardDoneButtonView_time;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTextTime:(id)sender {
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    tf_test.text = [df stringFromDate:timePicker.date];
}

-(void)timePickerDoneClicked {
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    selectedTime = [df stringFromDate:timePicker.date];
    [tf_test resignFirstResponder];
}

-(void)timePickerCancelClicked {
    tf_test.text = selectedTime;
    tf_test.delegate = self;
    tf_test.inputView = timePicker;
    [tf_test resignFirstResponder];
}

@end
