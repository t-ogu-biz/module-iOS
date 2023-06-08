//
//  ProductFetchedResultsController.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
import CoreData

class ProductFetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>, NSFetchedResultsControllerDelegate {
    
    static func getAllProduct() -> NSFetchedResultsController<NSFetchRequestResult> {
        // managedObjectContextを指定
        let managedObjectContext = CoreDataStack.managedObjectContext
        // NSFetchedResultsControllerの生成
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        // エンティティの名前を指定
        fetchRequest.entity = NSEntityDescription.entity(forEntityName: "Product", in: managedObjectContext)
        // 一度に取得するサイズの指定
        //fetchRequest.fetchBatchSize = 20
        // ソートキーの指定。セクションが存在する場合セクションに対応した属性を必ず最初に指定する
        let sortDescriptor = NSSortDescriptor(key: "productID", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        //セクションの名前として"publisher"を指定
        let fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch {
        }
        return fetchedResultsController
    }
    
    static func getProductWithID(productId: String) -> Array<Any> {
        // managedObjectContextを指定
        let managedObjectContext = CoreDataStack.managedObjectContext
        // NSFetchedResultsControllerの生成
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        // エンティティの名前を指定
        fetchRequest.entity = NSEntityDescription.entity(forEntityName: "Product", in: managedObjectContext)
        // 条件検索
        let predicates = [
            NSPredicate(format: "productID = %@", productId),
            ]
        let compoundedPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        fetchRequest.predicate = compoundedPredicate
        let fetchResults: Array = try! managedObjectContext.fetch(fetchRequest)
        return fetchResults
    }
}
