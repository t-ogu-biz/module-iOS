//
//  ProductInputView.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.//

import UIKit
import CoreData

protocol ProductInfoDelegate : class {
    func registProductInfo(productInfo:ProductInfo)
    func updateProductInfo(productInfo: ProductInfo)
    func removeProductInfo(productInfo: ProductInfo)
    func refreshProductInfo(productInfo: ProductInfo)
}

class ProductInputView: UIView {
    
    weak var delegate : ProductInfoDelegate?
    
    @IBOutlet weak var tf_id: UITextField!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_price: UITextField!
    
    let managedObjectContext = CoreDataStack.managedObjectContext
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("ProductInputView", owner:self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    // 登録ボタン押下
    @IBAction func registButtonTouchUpInside(_ sender: UIButton) {
        delegate?.registProductInfo(productInfo: getTextField())
    }
    
    // 変更ボタン押下
    @IBAction func updateButtonTouchUpInside(_ sender: UIButton) {
        delegate?.updateProductInfo(productInfo: getTextField())
    }
    
    // 削除ボタン押下
    @IBAction func removeButtonTouchUpInside(_ sender: UIButton) {
        delegate?.removeProductInfo(productInfo: getTextField())
    }
    
    // 更新ボタン押下
    @IBAction func refreshButtonTouchUpInside(_ sender: UIButton) {
        delegate?.refreshProductInfo(productInfo: getTextField())
    }
    
    // テキスト取得
    func getTextField() -> ProductInfo {
        let productInfo : ProductInfo? = ProductInfo()
        productInfo?.productID = tf_id.text
        productInfo?.productName = tf_name.text
        productInfo?.productPrice = tf_price.text
        return productInfo!
    }
    
    // テキスト入力覧削除
    func clearTextField() {
        tf_id.text = ""
        tf_name.text = ""
        tf_price.text = ""
    }
    
    // ビューに下線表示
    func addBottomBorder() {
        let layer = CALayer()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(layer)
    }
}
