//
//  StringUtil.swift
//  StringUtil
//
//  Created by 小口哲史 on 2017/05/15.
//  Copyright © 2017年 microwave. All rights reserved.
//

import Foundation

class StringUtil:NSObject {
    class func isNullorEmpty(txt:String?) -> Bool {
            if let unwarap = txt {
            } else {
                return true
            }
            if ("" == txt) || ("<null>" == txt) || (txt?.isEqual(NSNull()))! {
                return true
            }
        return false
    }
}
