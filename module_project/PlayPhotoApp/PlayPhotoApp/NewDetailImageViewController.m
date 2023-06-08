//
//  NewDetailImageViewController.m
//  NHK_ComApp
//
//  Created by 小口 哲史 on 2017/04/04.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "NewDetailImageViewController.h"
@interface NewDetailImageViewController ()
@end
@implementation NewDetailImageViewController
@synthesize img;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self  = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *closeBtn = [[UIBarButtonItem alloc] initWithTitle:@"閉じる" style:UIBarButtonItemStyleBordered target:self action:@selector(closeBtnClicked:)];
    
    
    self.navigationItem.leftBarButtonItem = closeBtn;
    self.navigationItem.title = @"イメージ拡大";
    //拡大縮小対応
    mScrollView.delegate = self;
    mScrollView.minimumZoomScale = 1.0;
    mScrollView.maximumZoomScale = 3.0;

    [self showImage:img];
}

-(void)closeBtnClicked:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)showImage:(UIImage*)image {
    mImageview.image = image;
}

#pragma mark - UIScrollViewDelegateメソッド
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    for (id subview in scrollView.subviews) {
        if([subview isKindOfClass:[UIImageView class]]){
            return subview;
        }
    }
    
    return nil;
}
- (void)scrollViewDidZoom:(UIScrollView*)_scrollView{
    // 画像の表示されている大きさを取得
    CGSize imgSize = mImageview.frame.size;
    imgSize.width *= _scrollView.zoomScale;
    imgSize.height *= _scrollView.zoomScale;
}

@end
