//
//  ViewController.swift
//  DynamicHeight
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let tableManager = DynamicHeightTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableManager.dataSource = DataManager.getDataSouceInfo() as Array<DataSourceInfo>
        tableManager.setNib(tb:tableView,nibName:"DynamicHeightCell")
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

