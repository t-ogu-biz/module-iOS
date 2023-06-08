//
//  ManagedObjectContext.m
//
//  Created by 小口 哲史 on 2017/01/30.
//  Copyright © 2017年 microwave. All rights reserved.
//
#import "ManagedObjectContext.h"
static ManagedObjectContext *sharedManagedObjectContext;
@implementation ManagedObjectContext

- (id)init {
    self = [super init];
    if (self) {
//        [self setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
    }
    return self;
}

+(id)sharedInstance {
    @synchronized(self) {
        if (sharedManagedObjectContext == nil) {
            sharedManagedObjectContext = [[ManagedObjectContext alloc] init];
            [sharedManagedObjectContext setPersistentStoreCoordinator:[ManagedObjectContext persistentStoreCoordinator]];
        }
    }
    return sharedManagedObjectContext;
}

//Returns the persistent store coordinator for the application.
//If the coordinator doesn't already exist, it is created and the application's store added to it.
+ (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"];
    /*********** 移行を行う為のoptionsを生成する  ***********/
    NSMutableDictionary *options = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                                    nil];
    //長坂さんが記載したものをコメントアウト
    //[options setObject:@"WAL" forKey:@"journal_mode"];
    NSError *error = nil;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    /*********** options指定ありでCoreDataを読み込む  **********/
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    return _persistentStoreCoordinator;
}

+ (NSManagedObjectModel *)managedObjectModel {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
    NSManagedObjectModel *_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the URL to the application's Documents directory.
+ (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (sharedManagedObjectContext == nil) {
            sharedManagedObjectContext = [super allocWithZone:zone];
            return sharedManagedObjectContext;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone*)zone {
    return self;  // シングルトン状態を保持するため何もせず self を返す
}

@end
