//
//  Product+CoreDataProperties.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productID: String?
    @NSManaged public var productName: String?
    @NSManaged public var binaryID: String?
    @NSManaged public var productPrice: String?

}
