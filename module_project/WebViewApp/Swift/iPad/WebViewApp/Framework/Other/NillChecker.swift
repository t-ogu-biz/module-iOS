//
//  NillChecker.swift
//  CommonViewController_test
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
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
