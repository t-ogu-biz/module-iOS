//
//  ProgressTableViewCell.m
//  TableView
//
//  Created by 小口 哲史 on 2017/03/02.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "ProgressTableViewCell.h"
@implementation ProgressTableViewCell
+(ProgressTableViewCell*)cellFromNibNamed:(NSString*)nibName {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    ProgressTableViewCell *customCell = nil;
    NSObject *nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[ProgressTableViewCell class]]) {
            customCell = (ProgressTableViewCell *)nibItem;
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
