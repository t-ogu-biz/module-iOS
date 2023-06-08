//
//  CreatePostBody.swift
//  request+response
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

let BOUNDARY:String = "____BOUNDARY____"

class CreatePostBody: NSObject {
    func createWithNameValuePair(mNameValuePairArray: NameValuePair) -> Data {
        let nameValuePairArray = mNameValuePairArray.get()
        let data = NSMutableData()
        //let fname = "test.jpg"
        
        for dict in nameValuePairArray {
            let key = (dict as! NSDictionary).object(forKey: "KEY_NAME") as! String
            //let valueCategory = (dict as! NSDictionary).object(forKey: "VALUE_CATEGORY_NAME") as! String
            var value = NSData()
            
            print("KEY_NAME : \((dict as! NSDictionary).object(forKey: "KEY_NAME") as! String)")
            print("VALUE_NAME : \((dict as! NSDictionary).object(forKey: "VALUE_NAME") as! String)")
            
            value = ((dict as! NSDictionary).object(forKey: "VALUE_NAME") as! String).data(using: String.Encoding.utf8)! as NSData
            /*
             if valueCategory.isEmpty {
             value = ((dict as! NSDictionary).object(forKey: "VALUE_NAME") as! String).data(using: .utf8)! as NSData
             } else {
             value = (dict as! NSDictionary).object(forKey: "VALUE_NAME") as! NSData
             }
             */
            
            data.append("--\(BOUNDARY)\r\n".data(using: String.Encoding.utf8)!)
            /*
             switch valueCategory {
             case "imageValue":
             data.append("Content-Disposition:form-data; name=\"\(key)\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
             data.append("Content-Type: image/jpeg\r\n\r\n".data(using: String.Encoding.utf8)!)
             data.append(data as Data)
             default:
             data.append("Content-Disposition:form-data; name=\"\(key)\"\r\n".data(using: String.Encoding.utf8)!)
             data.append("Content-Length: \(value.length)\r\n\r\n".data(using: String.Encoding.utf8)!)
             data.append(data as Data)
             }
             */
            
            data.append("Content-Disposition:form-data; name=\"\(key)\"\r\n".data(using: String.Encoding.utf8)!)
            data.append("Content-Length: \(value.length)\r\n\r\n".data(using: String.Encoding.utf8)!)
            data.append(value as Data)
            
            data.append("\r\n".data(using: String.Encoding.utf8)!)
        }
        data.append("--\(BOUNDARY)--\r\n".data(using: String.Encoding.utf8)!)
        return data as Data
    }
    
    func contentsType() -> String {
        return("multipart/form-data; boundary=\(BOUNDARY)")
    }
}
