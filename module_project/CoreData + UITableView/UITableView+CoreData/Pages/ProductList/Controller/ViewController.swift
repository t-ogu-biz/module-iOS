//
//  ViewController.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, NSFetchedResultsControllerDelegate, SetDelegate, ProductInfoDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customView: UIView!
    
    let tableManager:ProductTableViewManager = ProductTableViewManager()
    var productInputView : ProductInputView? = nil
    let managedObjectContext = CoreDataStack.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableManager.setNib(tb:tableView,nibName:"ProductListViewCell")
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        tableManager.fetchedResultsController = fetchedResultController()
        tableManager.delegate = self
        
        productInputView = ProductInputView(frame:CGRect(x:0, y:0, width:customView.frame.size.width, height:customView.frame.size.height))
        productInputView?.delegate = self
        productInputView?.addBottomBorder()
        customView.addSubview(productInputView!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshFetchedResultsController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func refreshFetchedResultsController() {
        tableManager.fetchedResultsController = fetchedResultController()
        self.view.endEditing(true)
        tableView.reloadData()
    }
    
    func fetchedResultController() -> NSFetchedResultsController<NSFetchRequestResult> {
        let fetchedResultsController : NSFetchedResultsController = ProductFetchedResultsController.getAllProduct()
        return fetchedResultsController
    }
    
    // データベース挿入
    func registProductInfo (productInfo: ProductInfo) {
        guard checkInputText(productInfo: productInfo) else {
            return
        }
        do {
            let results = ProductFetchedResultsController.getProductWithID(productId: productInfo.productID!) as! [Product]
            for product in results {
                if(product.productID == productInfo.productID) {
                    let alert = UIAlertController(title: Const.ERROR_TITLE, message: Const.ERROR_SET_PRODUCT, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
            if (results.count == 0) {
                let product: Product
                
                if #available(iOS 10.0, *) {
                    product = Product(context: CoreDataStack.managedObjectContext)
                } else {
                    // iOS10未満のバージョン (iOS10以上のバージョンも使用可能)
                    let managedObject : NSEntityDescription = NSEntityDescription.entity(forEntityName: "Product", in: managedObjectContext)!
                    product = Product(entity: managedObject, insertInto: managedObjectContext)
                }
                product.productID = productInfo.productID
                product.productName = productInfo.productName
                product.productPrice = productInfo.productPrice
                try managedObjectContext.save()
                
                refreshFetchedResultsController()
                productInputView?.clearTextField()
            }
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    // データベース更新
    func updateProductInfo(productInfo: ProductInfo) {
        guard checkInputText(productInfo: productInfo) else {
            return
        }
        do {
            let results = ProductFetchedResultsController.getProductWithID(productId: productInfo.productID!) as! [Product]
            if (results.count == 0) {
                let alert = UIAlertController(title: Const.ERROR_TITLE, message: Const.ERROR_NONE_PRODUCT, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            for product in results {
                if(product.productID == productInfo.productID) {
                    product.productID = productInfo.productID
                    product.productName = productInfo.productName
                    product.productPrice = productInfo.productPrice
                }
                try managedObjectContext.save()
                
                refreshFetchedResultsController()
                productInputView?.clearTextField()
            }
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    // データベース削除
    func removeProductInfo(productInfo: ProductInfo) {
        do {
            let results = ProductFetchedResultsController.getProductWithID(productId: productInfo.productID!) as! [Product]
            for product in results {
                managedObjectContext.delete(product)
            }
            try managedObjectContext.save()
            
            refreshFetchedResultsController()
            productInputView?.clearTextField()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    // データベース更新
    func refreshProductInfo(productInfo: ProductInfo) {
        refreshFetchedResultsController()
        productInputView?.clearTextField()
    }
    
    // 入力情報チェック
    func checkInputText(productInfo: ProductInfo) -> Bool {
        if (productInfo.productID.isEmpty) || (productInfo.productName.isEmpty) || (productInfo.productPrice.isEmpty) {
            let alert = UIAlertController(title: Const.ERROR_TITLE, message: Const.ERROR_MESSAGE, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    // 一覧から選択された商品情報をテキスト入力覧に表示
    func setTextField(productInfo: ProductInfo)  {
        productInputView?.tf_id.text = productInfo.productID
        productInputView?.tf_name.text = productInfo.productName
        productInputView?.tf_price.text = productInfo.productPrice
    }
    
    // 画面をタップすることでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

