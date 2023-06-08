//
//  SmartPhoneListViewCell.swift
//  TableViewApp
//
//  Created by 小口 哲史 on 2017/05/31.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class SmartPhoneListViewCell: UITableViewCell {
    @IBOutlet var img_device: UIImageView!
    @IBOutlet var lb_name: UILabel!
    @IBOutlet var lb_marker: UILabel!
    @IBOutlet var lb_weight: UILabel!
    @IBOutlet var lb_deviceSize: UILabel!
    @IBOutlet var lb_displaySize: UILabel!
    @IBOutlet var lb_spec: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
