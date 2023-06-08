//
//  ScrollViewController.m
//  ScrollViewApp
//
//  Created by 小口 哲史 on 2017/02/22.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController
@synthesize sv,section1View;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    dataSource = nil;
    dataSource = [DataManager getSmartPhoneInfo];
    
    CGRect original = self.sv.frame;
    CGSize conenSize = CGSizeMake(original.size.width, [SizeManager getObjectSizeHeight:100000]);
    sv.contentSize = conenSize;
    sv.bounces = NO;
    
    CGRect rect = section1View.frame;
    CGRect new = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, [SizeManager getObjectSizeHeight:438]);
    section1View.frame = new;

    [self update];
}

-(void)defineLayoutSv {
    float sizeHeight = section1View.frame.size.height + section2View.frame.size.height;
    CGSize conenSize = CGSizeMake(self.view.frame.size.width,sizeHeight);
    self.sv.contentSize = conenSize;
}

-(void)updateTest {
    [section2View removeFromSuperview];
    float x = sv.frame.origin.x;
    float y = section1View.frame.origin.y + section1View.frame.size.height;
    float width = sv.frame.size.width;
    section2View = [[View alloc] initWithFrame:x originy:y sizeWidth:width];
    [sv addSubview:section2View];
}

-(void)update {
    [section2View removeFromSuperview];
    int dataCount = (int)[dataSource count];
    NSLog(@"dateCount:%i",dataCount);
    float tvSizeHeight = dataCount * 148;
    
    CGRect frameSection2 = CGRectMake(sv.frame.origin.x, section1View.frame.origin.y + section1View.frame.size.height ,sv.frame.size.width,tvSizeHeight);
    section2View = [[View alloc] initWithFrame:frameSection2];
    [sv addSubview:section2View];
     [section2View.list reloadData];
    
    CGRect originalList = section2View.list.frame;
    CGRect newlList = CGRectMake(originalList.origin.x, originalList.origin.y, originalList.size.width, section2View.list.contentSize.height);
    section2View.list.frame = newlList;

    
    CGRect frameSection2_re = CGRectMake(sv.frame.origin.x, section1View.frame.origin.y + section1View.frame.size.height ,sv.frame.size.width,section2View.list.contentSize.height + 112);
    section2View = nil;
    section2View = [[View alloc] initWithFrame:frameSection2_re];
    [section2View sizeToFit];
    //[section2View.list reloadData];
    
    
    /*
    [section2View.list reloadData];
    
    CGRect frameList = section2View.list.frame;
    frameList.size.height = section2View.list.contentSize.height;
    section2View.list.frame = frameList;

    CGRect rect = section2View.frame;
    CGRect new = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, section2View.list.contentSize.height);
    section2View.frame = new;
    
    //[section2View sizeToFit];
    
      [self.sv addSubview:section2View];
    section2View.list.scrollEnabled = NO;
     
     */
    
    [self defineLayoutSv];
}

-(void)resizeToFitSubviews {
    float w = 0;
    float h = 0;
    for (UIView *v in [section2View subviews]) {
        float fw = v.frame.origin.x + v.frame.size.width;
        float fh = v.frame.origin.y + v.frame.size.height;
        w = MAX(fw, w);
        h = MAX(fh, h);
    }
    [section2View setFrame:CGRectMake(section2View.frame.origin.x, section2View.frame.origin.y, w, h)];
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)handleChangeBtn:(id)sender {
    [self update];
}


// テーブルロード後に以下を実行すればよい.
- (void)updateTableSize:(UITableView *)tableView {
    tableView.frame =
    CGRectMake(tableView.frame.origin.x,
               tableView.frame.origin.y,
               tableView.contentSize.width,
               MIN(tableView.contentSize.height,
                   tableView.bounds.size.height));
}




@end
