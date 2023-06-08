//
//  GridViewManager.m
//
//
//  Created by 小口哲史 on 2017/01/24.
//  Copyright © 2017年 yourCompany. All rights reserved.
//
#import "GridViewManager.h"
@implementation GridViewManager
@synthesize delegate,mainCon;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GridViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GridViewCell"];
        if (cell == nil) {
            cell = [GridViewCell cellFromNibNamed:@"GridViewCell"];
        }
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(GridViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.img_home_A.userInteractionEnabled = YES;
    [cell.img_home_A addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(handleA:)]];
    cell.img_home_B.userInteractionEnabled = YES;
    [cell.img_home_B addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                           initWithTarget:self action:@selector(handleB:)]];
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



@end
