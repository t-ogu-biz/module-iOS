//
//  GetAllAssetsTask.h
//  NHK_ComApp
//
//  Created by 小口 哲史 on 2017/04/04.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>
@import Photos;
typedef void (^OnPreExecuteBlockGetAllAssetsTask)();
typedef void (^OnPostExecuteBlockGetAllAssetsTask)(NSMutableArray *cameraRollInfo);
typedef void (^OnPreExecuteBlockGetSelectedFillPathTask)();
typedef void (^OnPostExecuteBlockGetSelectedFillPathTask)(NSString *filePath);
@interface GetAllAssetsTask : NSObject {
    int bgTask;
}


@property int allCount;
@property (nonatomic, strong) NSMutableArray *cameraRoll;
@property (nonatomic,strong)NSMutableDictionary *assetDic;



-(id)initWithPropetyInit;
-(void)getAllAssetsTaskWithPreTask:(OnPreExecuteBlockGetAllAssetsTask)onPre onPost:(OnPostExecuteBlockGetAllAssetsTask)onPost;
-(void)getSelectedFilePathTaskWithPreTask:(OnPreExecuteBlockGetSelectedFillPathTask)onPre onPost:(OnPostExecuteBlockGetSelectedFillPathTask)onPost;
-(id)initWithAssetDic:(NSMutableDictionary*)assetdic;

@end
