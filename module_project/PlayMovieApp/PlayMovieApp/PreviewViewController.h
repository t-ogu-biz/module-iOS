//
//  PreviewViewController
//
//  Created by 小口 哲史 on 2017/04/03.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
//　プレビュー画面。伝送する映像一覧画面で選択された動画のプレビューを表示する。

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PreviewViewController : AVPlayerViewController

@property NSURL *asset_url;

@end
