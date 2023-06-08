//
//  ViewController.m
//  PlayMovieApp
//
//  Created by 小口 哲史 on 2017/04/03.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePlayBtn:(id)sender {
    [self getAssets];
}

-(void)getAssets {
    GetAllAssetsTask *getTask = [[GetAllAssetsTask alloc] initWithPropetyInit];
    [getTask getAllAssetsTaskWithPreTask:^{
    } onPost:^(NSMutableArray *cameraRoll) {
        int assetObjCount = (int)[cameraRoll count];
            if (assetObjCount <= 0) {
                UIAlertView *alert = [[UIAlertView alloc] init];
                alert.title = @"注意";
                alert.message = @"カメラロールにデータが存在しない、または、カメラロールへのアクセスが許可されていません。\n動画撮影から動画を撮影する、または、設定からカメラロールへのアクセスを許可して下さい。";
                [alert addButtonWithTitle:@"はい"];
                [alert show];
                return;
            }
        //データソート
        NSArray *cameraRollArray = [cameraRoll copy];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"index" ascending:NO];
        NSArray *sortedCameraRoll = [cameraRollArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        NSMutableDictionary *assetDic = [sortedCameraRoll objectAtIndex:0];
        [self playMovie:assetDic];
    }];
}

-(void)playMovie:(NSMutableDictionary*)dic {
    GetAllAssetsTask *getTask = [[GetAllAssetsTask alloc] initWithAssetDic:dic];
    [getTask getSelectedFilePathTaskWithPreTask:^{
    } onPost:^(NSString *filePath) {
        PreviewViewController *pVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PreviewViewController"];
        pVC.asset_url = [NSURL URLWithString:filePath];
        [self presentViewController:pVC animated:YES completion:nil];
    }];
}

@end
