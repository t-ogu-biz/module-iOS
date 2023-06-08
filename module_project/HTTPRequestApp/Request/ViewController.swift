//
//  ViewController.swift
//  Request
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func upLoadRequest(_ sender: UIButton) {
        print("clicked")
        let getData = GetDataTask()
        getData.requestWithClosures(preTask: {
            print("preTask")
            //プログレスダイアログ表示
        }) { (dataInfo, error) in
            print("dataInfo : \(String(describing: dataInfo))")
            print("error : \(String(describing: error))")
            //プログレスダイアログ非表示
            //レスポンスデータの解析
            //エラーハンドリング
            if (error != nil) {
            }
        }
    }
}

