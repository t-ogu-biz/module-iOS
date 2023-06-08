//
//  NillChecker.swift
//  CommonViewController_test
//
//  Created by 小口 哲史 on 2017/05/11.
//  Copyright © 2017年 microwave. All rights reserved.
//

import Foundation
class NillChecker:NSObject {
    class func isNill(object:AnyObject?) -> Bool {
        var isNill:Bool = false
            if let unwarap = object {
            } else {
                isNill = true
            }
        return isNill
    }
}
