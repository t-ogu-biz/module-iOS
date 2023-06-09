//
//  PreviewViewController.m
//
//  Created by 小口 哲史 on 2017/04/03.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "PreviewViewController.h"


@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVPlayerItem* playerItem = [AVPlayerItem playerItemWithURL:self.asset_url];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemDidFinishPlaying:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];
    
    NSLog(@"%@", self.asset_url);
    self.player = [AVPlayer playerWithPlayerItem:playerItem];
    
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)itemDidFinishPlaying:(NSNotification *) notification {
    // Will be called when AVPlayer finishes playing playerItem
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
