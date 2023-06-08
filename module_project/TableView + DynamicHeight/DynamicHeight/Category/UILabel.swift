//
//  UILabel.swift
//  DynamicHeight
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

extension UILabel {
    func setDefaultLabelInfo() {
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.sizeToFit()
    }
}
