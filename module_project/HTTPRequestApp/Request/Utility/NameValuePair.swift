//
//  NameValuePair.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation

class NameValuePair: NSObject {
    var mNameValuePairArray = NSMutableArray()
    override init() {
        super.init()
        //mNameValuePairArray = NSMutableArray()
        //let unixTime = Date.getNowEpocTimeForString()
        //let authKeyGenerator = AuthKeyGenerator(unixTime: unixTime)
        //let authKey: String = authKeyGenerator.execute()
        //mNameValuePairArray.addValue(authKey, withKey: "authKey")
        //mNameValuePairArray.addValue(unixTime, withKey: "unixTime")
    }
    
    func addValue(value:String, key:String) {
        let valuePair = NSMutableDictionary()
        valuePair.setObject(key, forKey: "KEY_NAME" as NSCopying)
        valuePair.setObject(value, forKey: "VALUE_NAME" as NSCopying)
        mNameValuePairArray.addObjects(from: [valuePair])
    }
    
    func get() -> NSMutableArray {
        return mNameValuePairArray
    }
}
