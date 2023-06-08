//
//  View.m
//  XibApp
//
//  Created by 小口 哲史 on 2017/02/22.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "View.h"
@implementation View
@synthesize contentView,dataSource,list;


- (void)commonInit {
    NSString* className = NSStringFromClass([self class]);
    [[NSBundle bundleForClass:[self class]] loadNibNamed:className owner:self options:nil];
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];
    self.list.delegate = self;
    self.list.dataSource = self;
    dataSource =  [DataManager getSmartPhoneInfo];
    
}

- (instancetype)init {
    self = [super init];
        if (self) {
            [self commonInit];
        }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
        if (self) {
            [self commonInit];
        }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (instancetype)initWithFrame:(CGFloat)x originy:(CGFloat)y sizeWidth:(CGFloat)width {
    list.delegate = self;
    list.dataSource = self;
    dataSource =  [DataManager getSmartPhoneInfo];
    [list reloadData];
    CGRect originalList = list.frame;
    
    CGRect newlList = CGRectMake(originalList.origin.x, originalList.origin.y, originalList.size.width,list.contentSize.height);
    list.frame = newlList;
    
    CGRect new = CGRectMake(originalList.origin.x, originalList.origin.y, width,list.contentSize.height + 112);
    
    self = [super initWithFrame:new];
        if (self) {
            [self commonInit];
        }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataSource count];
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
    SmartPhoneInfo *info = [dataSource objectAtIndex:indexPath.row];
    cell.lable_name.text = info.name;
    cell.label_marker.text = info.marker;
    cell.label_weight.text = info.weight;
    cell.label_deviceSize.text = info.deviceSize;
    cell.label_displaySize.text = info.displaySize;
    cell.label_spec.text = info.cpu;
    cell.ImgView_device.image = [UIImage imageNamed:info.thumbnailFile];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 148.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // mSelectRowBlock(indexPath);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

-(void)upDateTableView:(CGRect)frame {
    NSLog(@"-(void)upDateTableView");
    int dataCount = (int)[dataSource count];
    NSLog(@"dateCount:%i",dataCount);
    float tvSizeHeight = dataCount * 148.0f;
    //CGRect rect = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, [SizeManager getObjectSizeHeight:tvSizeHeight] + 200);
    CGRect rect = CGRectMake(frame.origin.x, [SizeManager getObjectSizeHeight:190], frame.size.width, [SizeManager getObjectSizeHeight:tvSizeHeight] + 150);
    self.frame = rect;
    self.contentView.frame = rect;
    
    NSLog(@"tvSizeHeight:%f",tvSizeHeight);
    CGRect new = CGRectMake(self.list.frame.origin.x, self.list.frame.origin.y, self.frame.size.width, [SizeManager getObjectSizeHeight:tvSizeHeight]);
    self.list.frame = new;
}



@end
