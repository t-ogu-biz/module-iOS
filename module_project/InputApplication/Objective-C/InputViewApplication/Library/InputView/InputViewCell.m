//
//  InputViewCell.m
//  
//
//  Created by 小口 哲史 on 2017/02/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "InputViewCell.h"
@implementation InputViewCell
+(InputViewCell*)cellFromNibNamed:(NSString*)nibName {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    InputViewCell *customCell = nil;
    NSObject *nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[InputViewCell class]]) {
            customCell = (InputViewCell *)nibItem;
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
