//
//  SmartPhoneTableViewManager.swift
//  TableViewApp
//
//  Created by 小口 哲史 on 2017/05/31.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
class SmartPhoneTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    var dataSource:Array<SmartPhoneInfo> = Array<SmartPhoneInfo>()
    
    func setNib(tb:UITableView, nibName:String) {
        tb.register(UINib(nibName:nibName, bundle: nil), forCellReuseIdentifier:nibName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SmartPhoneListViewCell") as! SmartPhoneListViewCell
        configureCell(cell:cell,indexPath:indexPath)
        return cell
    }
    
    func configureCell(cell:SmartPhoneListViewCell, indexPath:IndexPath) {
        let info:SmartPhoneInfo = dataSource[indexPath.row]
        cell.img_device.image = UIImage(named:info.thumbnailFile)
        cell.lb_name.text = info.name
        cell.lb_marker.text = info.maker
        cell.lb_weight.text = info.weight
        cell.lb_deviceSize.text = info.deviceSize
        cell.lb_displaySize.text = info.displaySize
        cell.lb_spec.text = info.cpu
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
