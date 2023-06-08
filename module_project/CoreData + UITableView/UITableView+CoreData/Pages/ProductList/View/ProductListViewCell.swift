//
//  ProductListViewCell.swift
//  UITableView+CoreData
//
//  Created by 小口 哲史 on 2017/12/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ProductListViewCell: UITableViewCell {
    @IBOutlet var lb_id: UILabel!
    @IBOutlet var lb_name: UILabel!
    @IBOutlet var lb_price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
