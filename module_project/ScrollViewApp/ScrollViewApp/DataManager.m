//
//  DataManager.m
//  TableView
//
//  Created by 小口 哲史 on 2017/02/22.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
#import "DataManager.h"
@implementation DataManager

+(NSArray*)getSmartPhoneInfo {
    NSMutableArray *infos = [NSMutableArray array];
    SmartPhoneInfo *infoA = [[SmartPhoneInfo alloc] init];
    infoA.name = @"Xperia X Performance S0-04H";
    infoA.marker = @"ソニーモバイル";
    infoA.weight = @"165g";
    infoA.deviceSize = @"71×144×8.6mm";
    infoA.displaySize = @"5.0インチ";
    infoA.cpu = @"2.2GHz+1.6GHZクアッドコア";
    infoA.thumbnailFile = @"Xperia X Performance S0-04H.png";
    [infos addObject:infoA];
    
    SmartPhoneInfo *infoB = [[SmartPhoneInfo alloc] init];
    infoB.name = @"Xperia X Performance";
    infoB.marker = @"ソニーモバイル";
    infoB.weight = @"165g";
    infoB.deviceSize = @"71×144×8.6mm";
    infoB.displaySize = @"5.0インチ";
    infoB.cpu = @"2.2GHz+1.6GHZクアッドコア";
    infoB.thumbnailFile = @"Xperia X Performance.png";
    [infos addObject:infoB];
    
    SmartPhoneInfo *infoC = [[SmartPhoneInfo alloc] init];
    infoC.name = @"HUAWEI P9 Lite";
    infoC.marker = @"Huawei";
    infoC.weight = @"147g";
    infoC.deviceSize = @"73×147×7.5mm";
    infoC.displaySize = @"5.2インチ";
    infoC.cpu = @"2GHz+1.7GHZオタクコア";
    infoC.thumbnailFile = @"HUAWEI P9 Lite.png";
    [infos addObject:infoC];
    
    SmartPhoneInfo *infoD = [[SmartPhoneInfo alloc] init];
    infoD.name = @"AQUOS ZETA SH-04H";
    infoD.marker = @"シャープ";
    infoD.weight = @"155g";
    infoD.deviceSize = @"73×149×7.6mm";
    infoD.displaySize = @"5.3インチ";
    infoD.cpu = @"2.2GHz+1.6GHZクアッドコア";
    infoD.thumbnailFile = @"AQUOS ZETA SH-04H.png";
    [infos addObject:infoD];
    
    
    SmartPhoneInfo *infoE = [[SmartPhoneInfo alloc] init];
    infoE.name = @"HTC 10";
    infoE.marker = @"HTC";
    infoE.weight = @"161g";
    infoE.deviceSize = @"72×146×9.2mm";
    infoE.displaySize = @"5.2インチ";
    infoE.cpu = @"2.2GHz+1.6GHZクアッドコア";
    infoE.thumbnailFile = @"HTC 10.png";
    [infos addObject:infoE];
    
    SmartPhoneInfo *infoF = [[SmartPhoneInfo alloc] init];
    infoF.name = @"Galaxy S7 edge SCV33";
    infoF.marker = @"サムスン";
    infoF.weight = @"158g";
    infoF.deviceSize = @"73×151×7.7mm";
    infoF.displaySize = @"5.5インチ";
    infoF.cpu = @"2.2GHz+1.6GHZクアッドコア";
    infoF.thumbnailFile = @"Galaxy S7 edge SCV33.png";
    [infos addObject:infoF];
    
    SmartPhoneInfo *infoG = [[SmartPhoneInfo alloc] init];
    infoG.name = @"BREEZ X5";
    infoG.marker = @"Covia";
    infoG.weight = @"148g";
    infoG.deviceSize = @"73×145×8.9mm";
    infoG.displaySize = @"5.0インチ";
    infoG.cpu = @"1.1GHzクアッドコア";
    infoG.thumbnailFile = @"BREEZ X5.png";
    [infos addObject:infoG];
    
    SmartPhoneInfo *infoH = [[SmartPhoneInfo alloc] init];
    infoH.name = @"iPhone SE";
    infoH.marker = @"アップル";
    infoH.weight = @"113g";
    infoH.deviceSize = @"59×124×7.6mm";
    infoH.displaySize = @"4.0インチ";
    infoH.cpu = @"1.85GHzデュアルコア";
    infoH.thumbnailFile = @"iPhone SE.png";
    [infos addObject:infoH];

    return infos;
}

@end
