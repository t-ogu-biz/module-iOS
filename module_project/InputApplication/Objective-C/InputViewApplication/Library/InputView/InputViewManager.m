//
//  InputViewManager.m
//
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "InputViewManager.h"
@implementation InputViewManager
@synthesize delegate,mainCon,tableview;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InputViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InputViewCell"];
        if (cell == nil) {
            cell = [InputViewCell cellFromNibNamed:@"InputViewCell"];
        }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(InputViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.field_firstName.delegate = self;
    cell.field_firstName.tag = 0;
    cell.field_lastName.delegate = self;
    cell.field_lastName.tag = 1;
    cell.field_sheet1.delegate = self;
    cell.field_sheet1.tag = 2;
    cell.field_sheet2.delegate = self;
    cell.field_sheet2.tag = 3;
    cell.field_city.delegate = self;
    cell.field_city.tag = 4;
    cell.field_state.delegate = self;
    cell.field_state.tag = 5;
    cell.field_zipCode.delegate = self;
    cell.field_zipCode.tag = 6;
    cell.field_email.delegate = self;
    cell.field_email.tag = 7;
    cell.fielf_phone.delegate = self;
    cell.fielf_phone.tag = 8;
    [self registerForKeyboardNotifications];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [SizeManager getNaviConAppSizeHeight:mainCon];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //mSelectRowBlock(indexPath);
}

-(void)handleA:(id)sender {
    if (delegate && [delegate respondsToSelector:@selector(handleA)]) {
        [delegate handleA];
    }
}

-(void)handleB:(id)sender {
    if (delegate && [delegate respondsToSelector:@selector(handleB)]) {
        [delegate handleB];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    tf = textField;
    tableview.scrollEnabled = true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)sender {
    [sender resignFirstResponder];
    tableview.scrollEnabled = false;
    return true;
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification {
    if (tf.tag >= 5) {
        CGPoint scrollPoint = CGPointMake(0.0,150.0);
        [tableview setContentOffset:scrollPoint animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
     [tableview setContentOffset:CGPointZero animated:YES];
}

@end
