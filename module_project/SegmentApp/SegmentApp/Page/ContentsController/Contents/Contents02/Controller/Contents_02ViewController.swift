//
//  Contents_02ViewController.swift
//  SegmentApp
//
//  Created by 小口 哲史 on 2018/01/30.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class Contents_02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Contents_02ViewController_viewDidLoad")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Contents_02ViewController_viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Contents_02ViewController_viewDidAppear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
