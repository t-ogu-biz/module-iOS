//
//  ViewController.swift
//  InputViewApplication
//
//  Created by 小口 哲史 on 2017/12/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var iVMgr:InputViewManager = InputViewManager()
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iVMgr.setNib(tb:tv, nibName:"InputViewCell")
        tv.delegate = iVMgr
        tv.dataSource = iVMgr
        iVMgr.tv = tv
        iVMgr.tv?.isScrollEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

