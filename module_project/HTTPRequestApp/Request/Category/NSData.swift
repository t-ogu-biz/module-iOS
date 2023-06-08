//
//  NSData.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation

extension NSData {
    public func JSONValue() -> NSDictionary {
        let json = try? JSONSerialization.jsonObject(with: self as Data, options: [])
        return json as! NSDictionary
    }
}
