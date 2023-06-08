//
//  MultiPartRequestWithSession.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import Foundation
import UIKit

class MultiPartRequestWithSession: NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {
    let createPostBody = CreatePostBody()
    var mNameValuePair: NameValuePair?
    var mMutableData: NSData?
    var mData: NSData?
    var mError: NSError?
    var mUrl = ""
    
    init(url: String, NameValuePair: NameValuePair) {
        super.init()
        mUrl = url
        mNameValuePair = NameValuePair
    }
    
    func pullData() -> RequestResultItem {
        var request = URLRequest(url: URL(string:mUrl)!)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.setValue(createPostBody.contentsType(), forHTTPHeaderField: "Content-Type")
        let body = createPostBody.createWithNameValuePair(mNameValuePairArray: mNameValuePair!)
        request.httpBody = body as Data
        
        mData = nil
        mError = nil
        let configuration = URLSessionConfiguration.background(withIdentifier: "bgSessionConfiguration")
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        // タスクの生成.
        let task = session.dataTask(with: request)
        // タスクの実行.
        task.resume()
        
        var time: Int = 0
        while (mError == nil && mData == nil) && time <= 10000 {
            Thread.sleep(forTimeInterval: 0.001)
            time += 1
        }
        
        let result = RequestResultItem()
        result.data = mData
        result.error = mError
        
        if time > 10000 {
            result.error = NSError.errorOfTimeout()
            task.cancel()
        }
        
        /*
        if (result.error == nil) {
            result.error = try? createFormattedError()
            result.data = nil
        }
         */
        
        if (result.error != nil) {
        }
        return result
    }
    
    private func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: (URLSession.ResponseDisposition) -> Void) {
        mMutableData = NSData()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        mMutableData = data as NSData
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                self.mError = error as NSError
                print("error")
            } else {
                self.mData = self.mMutableData
                print("success")
            }
        }
    }

    // HTTPSにリクエストする為に自己証明書を参照する
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if challenge.protectionSpace.host == "ncom.soundcream.net" {
                if let certFile = Bundle.main.path(forResource:"rt.server", ofType: "der"),
                    let data = try? Data(contentsOf: URL(fileURLWithPath: certFile)),
                    let cert = SecCertificateCreateWithData(nil, data as CFData),
                    let trust = challenge.protectionSpace.serverTrust {
                    SecTrustSetAnchorCertificates(trust, [cert] as CFArray)
                    completionHandler(.useCredential, URLCredential(trust: trust))
                } else {
                    completionHandler(.cancelAuthenticationChallenge, nil)
                }
            } else {
                completionHandler(.performDefaultHandling, nil)
            }
        }
    }
}
