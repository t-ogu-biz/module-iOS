//
//  CoreDataStack.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    // MARK: - Core Data stack
    
    // アプリケーションがコアデータストアファイル(sqlite)を格納するために使用するディレクトリ。アプリケーションのドキュメントApplication Supportディレクトリにあるディレクトリを使用する。
    static var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    // アプリケーションの管理オブジェクトモデル。このプロパティはオプションではない。アプリケーションがモデルを見つけて読み込めないことが致命的なエラーになる。
    static var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle(for: CoreDataStack.self).url(forResource: "DATA_MODEL", withExtension: "momd")! // ".xcdatamodeld"のファイル名を指定
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    // アプリケーションの永続ストアコーディネータ。この実装は、アプリケーションのストアを追加したコーディネーターを作成して返す。ストアの作成を失敗させる正当なエラー条件が存在するため、このプロパティはオプション。
    static var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // コーディネーターとストアを作成する
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let url = applicationDocumentsDirectory.appendingPathComponent("DATA_MODEL.sqlite") // データベース名を指定
        var failureReason = "There was an error creating or loading the application's saved data."
        let options = [NSMigratePersistentStoresAutomaticallyOption: NSNumber(value: true as Bool), NSInferMappingModelAutomaticallyOption: NSNumber(value: true as Bool)]
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    }()
    
    // アプリケーションの管理対象オブジェクトコンテキスト（アプリケーションの永続ストアコーディネータに既にバインドされている）を返す。コンテキストの作成に失敗する可能性がある正当なエラー条件が存在するため、このプロパティはオプション。
    static var managedObjectContext: NSManagedObjectContext = {
        let coordinator = persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
}
