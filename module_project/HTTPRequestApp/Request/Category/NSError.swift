//
//  NSError.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation

let ERROR_TIMEOUT_ERRORCODE = 1000
let ERROR_DOMAIN_HEADER = "net.microwave.test."

extension NSError {
    class func errorOfTimeout() -> NSError {
        // ドメインを生成
        let domain: String = ERROR_DOMAIN_HEADER + ("Timeout")
        // userInfoを生成(LcalizedDescriptionをアラートの説明文に使用する)
        let userInfo = [NSLocalizedDescriptionKey : "サーバーが混雑しているか、ネットワークが繋がりにくい為、通信を中断しました。\n通信環境の良い所で、もう一度お試しください。" ]
        // エラーコード、ドメイン、ユーザーインフォを元にNSErrorを生成する
        let error = NSError(domain: domain, code: ERROR_TIMEOUT_ERRORCODE, userInfo: userInfo)
        return error
    }
}
