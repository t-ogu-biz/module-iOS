//
//  ProgressTableViewManager.m
//  TableView
//
//  Created by 小口 哲史 on 2017/03/02.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "ProgressTableViewManager.h"
@implementation ProgressTableViewManager
@synthesize dataSource;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.dataSource count];
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProgressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProgressTableViewCell"];
        if (cell == nil) {
            cell = [ProgressTableViewCell cellFromNibNamed:@"ProgressTableViewCell"];
        }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(ProgressTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    CellInfo *info = [dataSource objectAtIndex:indexPath.row];
    NSNumber *rate = (NSNumber*)info.rate;
    cell.progress.progress = [rate floatValue];
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
    return 85.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // mSelectRowBlock(indexPath);
}

@end
