//
//  InputViewCell.swift
//  InputViewApplication
//
//  Created by 小口 哲史 on 2017/12/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class InputViewCell: UITableViewCell {
    @IBOutlet weak var field_firstName: UITextField!
    @IBOutlet weak var field_lastName: UITextField!
    @IBOutlet weak var field_sheet1: UITextField!
    @IBOutlet weak var field_sheet2: UITextField!
    @IBOutlet weak var field_city: UITextField!
    @IBOutlet weak var field_state: UITextField!
    @IBOutlet weak var field_zipCode: UITextField!
    @IBOutlet weak var field_email: UITextField!
    @IBOutlet weak var fielf_phone: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
