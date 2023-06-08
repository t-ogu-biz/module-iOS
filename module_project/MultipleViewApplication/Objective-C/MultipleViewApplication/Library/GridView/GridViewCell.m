//
//  GridViewCell.m
//  
//
//  Created by 小口哲史 on 2017/01/24.
//  Copyright © 2017年 yourCompany. All rights reserved.
//
#import "GridViewCell.h"
@implementation GridViewCell
+(GridViewCell*)cellFromNibNamed:(NSString*)nibName {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    GridViewCell *customCell = nil;
    NSObject *nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[GridViewCell class]]) {
            customCell = (GridViewCell *)nibItem;
            break;
        }
    }
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return customCell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    return self;
}

@end
