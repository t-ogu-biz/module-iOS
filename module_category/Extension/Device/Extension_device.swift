//
//  Extension_device.swift
//  
//
//  Created by 小口 哲史 on 2017/04/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

/*
 * 画面サイズ(インチ)を返却するメソッド
 *
 * @methodOf Extension_device
 */
extension UIDevice {
    class func getScreenSize()->String {
        var modelName:String = UIDevice.current.model
            if !modelName.hasPrefix("iPad") {
                let r:CGRect = UIScreen.main.bounds
                //iPhone4、iPhone4S
                if r.size.height == 480 {
                    modelName = "3.5"
                //iPhone5、iPhone5S
                } else if r.size.height == 568 {
                    modelName = "4.0"
                //iPhone6、iPhone6S、iPhone7、iPhone7S
                } else if r.size.height == 667 {
                    modelName = "4.7"
                //iPhone6Plus、iPhone6SPlus、iPhone7Plus、iPhone7SPlus
                } else if r.size.height == 736 {
                    modelName = "5.5"
                } else {
                    modelName = "4.0"
                }
            } else {
                modelName = "4.0"
            }
        return modelName;
    }
}
