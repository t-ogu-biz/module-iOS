//
//  GetAllAssetsTask.m
//  NHK_ComApp
//
//  Created by 小口 哲史 on 2017/04/03.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "GetAllAssetsTask.h"
@implementation GetAllAssetsTask
@synthesize assetDic,allCount,cameraRoll;
-(id)initWithPropetyInit {
    self = [super init];
    if (self) {
        cameraRoll = [NSMutableArray array];
    }
    return self;
}

-(id)initWithAssetDic:(NSMutableDictionary*)assetdic {
    self = [super init];
        if (self) {
            assetDic = [NSMutableDictionary dictionary];
            assetDic = assetdic;
        }
    return self;
}

-(void)getAllAssetsTaskWithPreTask:(OnPreExecuteBlockGetAllAssetsTask)onPre onPost:(OnPostExecuteBlockGetAllAssetsTask)onPost {
    dispatch_queue_t q_global, q_main;
    q_global = dispatch_get_global_queue(0, 0);
    q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        dispatch_async(q_main, ^{
            onPre();
        });
        PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum
                                                                         subtype:PHAssetCollectionSubtypeSmartAlbumVideos
                                                                         options:nil];
        PHAssetCollection *assetCollection = result.firstObject;
        PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
        allCount = (int)fetchResult.count;
        if (allCount > 0) {
            [fetchResult enumerateObjectsUsingBlock:^(PHAsset *asset, NSUInteger idx, BOOL *stop) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                NSNumber *indexNum = [NSNumber numberWithInteger:idx];
                [dic setObject:indexNum forKey:@"index"];
                [dic setObject:asset forKey:@"asset"];
                [cameraRoll addObject:dic];
                int cameraRollCount = (int)[cameraRoll count];
                    if (allCount == cameraRollCount) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            //*stop = YES;
                            onPost(cameraRoll);
                            return ;
                    });
                }
            }];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                onPost(cameraRoll);
                return ;
            });
        }
    });
}

-(void)getSelectedFilePathTaskWithPreTask:(OnPreExecuteBlockGetSelectedFillPathTask)onPre onPost:(OnPostExecuteBlockGetSelectedFillPathTask)onPost {
    dispatch_queue_t q_global, q_main;
    q_global = dispatch_get_global_queue(0, 0);
    q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        dispatch_async(q_main, ^{
            onPre();
        });
        PHAsset *asset = [assetDic objectForKey:@"asset"];
            if([asset mediaType] == PHAssetMediaTypeVideo) {
                //動画
                [[PHImageManager defaultManager] requestPlayerItemForVideo:asset options:nil resultHandler:^
                 (AVPlayerItem * _Nullable playerItem, NSDictionary * _Nullable info) {
                     AVAsset *avAsset = playerItem.asset;
                     //拡張子取得
                     NSString *ext = [[[(AVURLAsset *)avAsset URL] path] pathExtension];
                     //ファイルパス生成
                     NSString *localIdentifier = asset.localIdentifier;
                     NSString *pathString = [localIdentifier substringToIndex:[localIdentifier rangeOfString:@"/"].location];
                     NSString *alUrl=[NSString stringWithFormat:@"assets-library://asset/asset.%@?id=%@&ext=%@", ext, pathString, ext];
                         dispatch_async(q_main, ^{
                             onPost(alUrl);
                             return;
                         });
                 }];
            } else {
                //画像
                [asset requestContentEditingInputWithOptions:nil completionHandler:^(PHContentEditingInput *contentEditingInput, NSDictionary *info) {
                    //拡張子取得
                    NSString *ext = [[contentEditingInput.fullSizeImageURL path] pathExtension];
                    //ファイルパス生成
                    NSString *localIdentifier = asset.localIdentifier;
                    NSString *pathString = [localIdentifier substringToIndex:[localIdentifier rangeOfString:@"/"].location];
                    NSString *alUrl=[NSString stringWithFormat:@"assets-library://asset/asset.%@?id=%@&ext=%@", ext, pathString, ext];
                        dispatch_async(q_main, ^{
                            onPost((alUrl));
                            return;
                        });
                }];
            }
    });
}


@end
