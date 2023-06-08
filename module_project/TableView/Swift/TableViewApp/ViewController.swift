//
//  ViewController.swift
//  TableViewApp
//
//  Created by 小口 哲史 on 2017/05/31.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var utb: UITableView!
    let tableManager:SmartPhoneTableViewManager = SmartPhoneTableViewManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableManager.dataSource = DataManager.getSmartPhoneInfo() as Array<SmartPhoneInfo>
        tableManager.setNib(tb:utb,nibName:"SmartPhoneListViewCell")
        utb.delegate = tableManager
        utb.dataSource = tableManager
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
