//
//  ManagedObjectContext.h
//
//
//  Created by 小口 哲史 on 2017/01/30.
//  Copyright © 2017年 microwave. All rights reserved.
//

#import <CoreData/CoreData.h>
//NSManagedObjectContextを使い回す為のSingletonクラス
//CoreData処理は必ずメインスレッドで実行しなければならない
@interface ManagedObjectContext : NSManagedObjectContext

+(id)sharedInstance;

@end
