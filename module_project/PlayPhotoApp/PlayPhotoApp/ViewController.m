//
//  ViewController.m
//  PlayPhotoApp
//
//  Created by 小口 哲史 on 2017/04/04.
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

- (IBAction)handlePlayPhotoBtn:(id)sender {
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
        NSArray *cameraRollArray = [cameraRoll copy];
        NSSortDescriptor *sortDescriptorIndex = [[NSSortDescriptor alloc] initWithKey:@"index" ascending:NO];
        NSSortDescriptor *sortDescriptorPhoto = [[NSSortDescriptor alloc] initWithKey:@"isPhoto" ascending:NO];
        NSArray *sortedCameraRoll = [cameraRollArray sortedArrayUsingDescriptors:@[sortDescriptorIndex,sortDescriptorPhoto]];
        NSMutableDictionary *assetDic = [sortedCameraRoll objectAtIndex:0];
        [self playMovie:assetDic];
    }];
}

-(void)playMovie:(NSMutableDictionary*)dic {
    PHAsset *asset = [dic objectForKey:@"asset"];
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.synchronous = YES;
    options.version = PHImageRequestOptionsVersionCurrent;
    [[PHImageManager defaultManager] requestImageDataForAsset:asset options:options resultHandler:^
     (NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
         UIImage *img = [[UIImage alloc] initWithData:imageData];
         dispatch_async(dispatch_get_main_queue(), ^{
             NewDetailImageViewController *imageViewer = [[NewDetailImageViewController alloc] init];
             imageViewer.img = img;
             UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:imageViewer];
             naviController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
             [self presentViewController:naviController animated:YES completion:nil];
         });
     }];
}

@end
