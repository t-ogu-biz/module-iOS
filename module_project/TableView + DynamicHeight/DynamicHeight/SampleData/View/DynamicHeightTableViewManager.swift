//
//  DynamicHeightTableViewManager.swift
//  DynamicHeight
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class DynamicHeightTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    var dataSource = Array<DataSourceInfo>()
    
    func setNib(tb:UITableView, nibName:String) {
        tb.register(UINib(nibName:nibName, bundle: nil), forCellReuseIdentifier:nibName)
        tb.layoutIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicHeightCell") as! DynamicHeightCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        configureCell(cell:cell,indexPath:indexPath)
        return cell
    }
    
    func configureCell(cell:DynamicHeightCell, indexPath:IndexPath) {
        let info:DataSourceInfo = dataSource[indexPath.row]
        cell.setData(dataItem: info)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let info:DataSourceInfo = dataSource[indexPath.row]

        let nameHeight = (info.name?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 14.0)))!
        let titleHeight = (info.title?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 11.0)))!
        let subjectHeight = (info.subject?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 11.0)))!
        let dateHeight = (info.date?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 11.0)))!
        
        return nameHeight + titleHeight + subjectHeight + dateHeight + (CONSTRAINT_LABEL_SPACE * 5)
    }
}
