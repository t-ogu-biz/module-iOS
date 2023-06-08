//
//  SmartPhoneListViewCell.m
//  TableView
//
//  Created by 小口哲史 on 2016/06/18.
//  Copyright © 2016年 yourCompany. All rights reserved.
//
#import "SmartPhoneListViewCell.h"
@implementation SmartPhoneListViewCell
+(SmartPhoneListViewCell*)cellFromNibNamed:(NSString*)nibName {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    SmartPhoneListViewCell *customCell = nil;
    NSObject *nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[SmartPhoneListViewCell class]]) {
            customCell = (SmartPhoneListViewCell *)nibItem;
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
