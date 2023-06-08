//
//  NewDetailImageViewController.h
//  NHK_ComApp
//
//  Created by 小口 哲史 on 2017/04/04.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NewDetailImageViewController : UIViewController<UIScrollViewDelegate>{
    // 拡大縮小を可能にするScrollView.
    __weak IBOutlet UIScrollView *mScrollView;
    // イメージを表示するView.
    __weak IBOutlet UIImageView *mImageview;
}

@property(nonatomic)UIImage *img;


@end
