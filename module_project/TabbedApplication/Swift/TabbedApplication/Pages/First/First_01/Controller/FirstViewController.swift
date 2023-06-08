//
//  FirstViewController.swift
//  TabbedApplication
//
//  Created by 小口 哲史 on 2017/05/17.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func handleSegueBtn(_ sender: Any) {
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: LOCAL_NOTIFICATION_SUGUE_FIRST_02_VIEW), object: nil))
    }
}

