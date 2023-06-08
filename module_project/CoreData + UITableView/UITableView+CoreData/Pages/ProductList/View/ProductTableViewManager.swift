//
//  ProductTableViewManager.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
import CoreData

protocol SetDelegate: class {
    func setTextField(productInfo: ProductInfo)
}

class ProductTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    weak var delegate : SetDelegate?
    
    func setNib(tb:UITableView, nibName:String) {
        tb.register(UINib(nibName:nibName, bundle: nil), forCellReuseIdentifier:nibName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = fetchedResultsController.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListViewCell") as! ProductListViewCell
        configureCell(cell:cell, indexPath:indexPath)
        return cell
    }
    
    func configureCell(cell:ProductListViewCell, indexPath:IndexPath) {
        let info = fetchedResultsController.object(at: indexPath) as! Product
        cell.lb_id.text = info.productID
        cell.lb_name.text = info.productName
        cell.lb_price.text = info.productPrice
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = fetchedResultsController.object(at: indexPath) as! Product
        let productInfo : ProductInfo? = ProductInfo()
        productInfo?.productID = info.productID
        productInfo?.productName = info.productName
        productInfo?.productPrice = info.productPrice
        self.delegate?.setTextField(productInfo: productInfo!)
    }
}
