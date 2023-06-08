//
//  SmartPhoneTableViewManager.m
//  TableView
//
//  Created by 小口哲史 on 2016/06/19.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import "SmartPhoneTableViewManager.h"
@implementation SmartPhoneTableViewManager

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SmartPhoneListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SmartPhoneListViewCell"];
        if (cell == nil) {
            cell = [SmartPhoneListViewCell cellFromNibNamed:@"SmartPhoneListViewCell"];
        }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(SmartPhoneListViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    SmartPhoneInfo *info = [self.dataSource objectAtIndex:indexPath.row];
    cell.lable_name.text = info.name;
    cell.label_marker.text = info.marker;
    cell.label_weight.text = info.weight;
    cell.label_deviceSize.text = info.deviceSize;
    cell.label_displaySize.text = info.displaySize;
    cell.label_spec.text = info.cpu;
    cell.ImgView_device.image = [UIImage imageNamed:info.thumbnailFile];
}

/*
 -(void)tableView:(UITableView*)tableView willDisplayCell:(CoverageHistoryListViewCell*)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (indexPath.row == 0 || indexPath.row%2 == 0) {
 cell.color =  [UIColor hexToUIColor:TABLE_VIEW_ROW_COLOR_DEEP_OTHER alpha:1.0];
 cell.backGround.backgroundColor = [UIColor hexToUIColor:TABLE_VIEW_ROW_COLOR_DEEP_OTHER alpha:1.0];
 } else {
 cell.backGround.backgroundColor = [UIColor hexToUIColor:TABLE_VIEW_ROW_COLOR_THIN_OTHER  alpha:1.0];
 cell.color = [UIColor hexToUIColor:TABLE_VIEW_ROW_COLOR_THIN_OTHER  alpha:1.0];
 }
 cell.backgroundColor = [UIColor clearColor];
 }
 */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 148.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // mSelectRowBlock(indexPath);
}

@end
