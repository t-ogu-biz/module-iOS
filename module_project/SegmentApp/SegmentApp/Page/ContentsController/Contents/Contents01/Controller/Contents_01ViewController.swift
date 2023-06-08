//
//  Contents_01ViewController.swift
//  SegmentApp
//
//  Created by 小口 哲史 on 2018/01/30.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class Contents_01ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let tableManager:SmartPhoneTableViewManager = SmartPhoneTableViewManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Contents_01ViewController_viewDidLoad")
        //tableManager.dataSource = DataManager.getSmartPhoneInfo() as Array<SmartPhoneInfo>
        tableManager.setNib(tb:tableView,nibName:"SmartPhoneListViewCell")
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Contents_01ViewController_viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Contents_01ViewController_viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reload() {
        tableManager.dataSource = DataManager.getSmartPhoneInfo() as Array<SmartPhoneInfo>
        tableView.reloadData()
    }
    
    
    
}
