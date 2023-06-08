//
//  GetDataTask.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation
import UIKit

class GetDataTask: NSObject {
    typealias GetDataTaskPreTask = () -> Void
    typealias GetDataTaskPostTask = (_ dataInfo: NSDictionary?, _ error: Error?) -> Void
    var bgTask: UIBackgroundTaskIdentifier?
    
    func requestWithClosures(preTask: @escaping GetDataTaskPreTask, postTask: @escaping GetDataTaskPostTask) {
        DispatchQueue.global(qos: .default).async {
            self.bgTask = UIApplication.shared.beginBackgroundTask() {
                [weak self] in
                UIApplication.shared.endBackgroundTask((self?.bgTask)!)
                self?.bgTask = UIBackgroundTaskInvalid
            }
            DispatchQueue.main.async {
                preTask()
            }
            let result: RequestResultItem? = self.request()
            DispatchQueue.main.async {
                if result?.error != nil {
                    postTask(nil, result?.error)
                } else {
                    let data = result?.data?.JSONValue()
                    
                    postTask(data, nil)
                }
                UIApplication.shared.endBackgroundTask((self.bgTask)!)
                self.bgTask = UIBackgroundTaskInvalid
            }
        }
    }
    
    func request() -> RequestResultItem {
        let url = "https://ncom:vgypw4bs@ncom.soundcream.net/api_f5000/"
        let nameValuePair = NameValuePair()
        nameValuePair.addValue(value: "ffb819c6e710a0779aaf450975e1a0d9", key: "authCode")
        nameValuePair.addValue(value: "2eb506285a89e7594a58e06ad8e85ea0608d3000f198d05bf4d8373ef941bdb8", key: "authKey")
        nameValuePair.addValue(value: "1513845383", key: "unixTime")
        
        let request = MultiPartRequestWithSession.init(url: url, NameValuePair: nameValuePair)
        return request.pullData()
    }
}
