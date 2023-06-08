//
//  DynamicHeightCell.swift
//  DynamicHeight
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

let CONSTRAINT_LABEL_WIDTH:CGFloat = 332.0
let CONSTRAINT_LABEL_SPACE:CGFloat = 8.0

class DynamicHeightCell: UITableViewCell {
    @IBOutlet var lb_name: UILabel!
    @IBOutlet var lb_title: UILabel!
    @IBOutlet var lb_subject: UILabel!
    @IBOutlet var lb_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(dataItem: DataSourceInfo) {
        lb_name.text = dataItem.name
        let nameSize = (lb_name.text?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 14.0)))!
        lb_name.frame = CGRect(x: CONSTRAINT_LABEL_SPACE, y: CONSTRAINT_LABEL_SPACE, width: CONSTRAINT_LABEL_WIDTH, height: nameSize)
        lb_name.setDefaultLabelInfo()
        
        lb_title.text = dataItem.title
        let titleSize = (lb_title.text?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 11.0)))!
        lb_title.frame = CGRect(x: CONSTRAINT_LABEL_SPACE, y: nameSize + (CONSTRAINT_LABEL_SPACE * 2), width: CONSTRAINT_LABEL_WIDTH, height: titleSize)
        lb_title.setDefaultLabelInfo()

        lb_subject.text = dataItem.subject
        let subjectSize = (lb_subject.text?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 11.0)))!
        lb_subject.frame = CGRect(x: CONSTRAINT_LABEL_SPACE, y: nameSize + titleSize + (CONSTRAINT_LABEL_SPACE * 3), width: CONSTRAINT_LABEL_WIDTH, height: subjectSize)
        lb_subject.setDefaultLabelInfo()
        
        lb_date.text = dataItem.date
        let dateSize = (lb_date.text?.heightWithConstrainedWidth(width: CONSTRAINT_LABEL_WIDTH, font: UIFont.systemFont(ofSize: 11.0)))!
        lb_date.frame = CGRect(x: CONSTRAINT_LABEL_SPACE, y: nameSize + titleSize + subjectSize + (CONSTRAINT_LABEL_SPACE * 4), width: CONSTRAINT_LABEL_WIDTH, height: dateSize)
        lb_date.setDefaultLabelInfo()
        
        self.contentView.addSubview(lb_name)
        self.contentView.addSubview(lb_title)
        self.contentView.addSubview(lb_subject)
        self.contentView.addSubview(lb_date)
    }
}
