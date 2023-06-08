//
//  XibView.swift
//  XibApp
//
//  Created by 小口 哲史 on 2017/11/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

protocol DateChangeViewDelegate {
    func handleSelectedDay()
}

class DateChangeView: UIView {
    var delegate: DateChangeViewDelegate?
    var businessDatesData: [DateData] = []
    var selectedDayIndex = 0
    @IBOutlet var dayOfWeekLb_index0: UILabel!
    @IBOutlet var selectedDayNoticView_index0: UIImageView!
    @IBOutlet var day_index0: UILabel!

    @IBOutlet var dayOfWeekLb_index01: UILabel!
    @IBOutlet var selectedDayNoticView_index01: UIImageView!
    @IBOutlet var day_index01: UILabel!
    
    @IBOutlet var dayOfWeekLb_index02: UILabel!
    @IBOutlet var selectedDayNoticView_index02: UIImageView!
    @IBOutlet var day_index02: UILabel!
    
    @IBOutlet var dayOfWeekLb_index03: UILabel!
    @IBOutlet var selectedDayNoticView_index03: UIImageView!
    @IBOutlet var day_index03: UILabel!
    
    @IBOutlet var dayOfWeekLb_index04: UILabel!
    @IBOutlet var selectedDayNoticView_index04: UIImageView!
    @IBOutlet var day_index04: UILabel!
    
    @IBOutlet var dayOfWeekLb_index05: UILabel!
    @IBOutlet var selectedDayNoticView_index05: UIImageView!
    @IBOutlet var day_index05: UILabel!
    
    @IBOutlet var dayOfWeekLb_index06: UILabel!
    @IBOutlet var selectedDayNoticView_index06: UIImageView!
    @IBOutlet var day_index06: UILabel!
    
    // MARK: - 初期化関連
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
        let gesture_index0: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index0.tag = 0
        selectedDayNoticView_index0.isUserInteractionEnabled = true
        selectedDayNoticView_index0.addGestureRecognizer(gesture_index0)
        let gesture_index01: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index01.tag = 1
        selectedDayNoticView_index01.isUserInteractionEnabled = true
        selectedDayNoticView_index01.addGestureRecognizer(gesture_index01)
        let gesture_index02: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index02.tag = 2
        selectedDayNoticView_index02.isUserInteractionEnabled = true
        selectedDayNoticView_index02.addGestureRecognizer(gesture_index02)
        let gesture_index03: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index03.tag = 3
        selectedDayNoticView_index03.isUserInteractionEnabled = true
        selectedDayNoticView_index03.addGestureRecognizer(gesture_index03)
        let gesture_index04: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index04.tag = 4
        selectedDayNoticView_index04.isUserInteractionEnabled = true
        selectedDayNoticView_index04.addGestureRecognizer(gesture_index04)
        let gesture_index05: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index05.tag = 5
        selectedDayNoticView_index05.isUserInteractionEnabled = true
        selectedDayNoticView_index05.addGestureRecognizer(gesture_index05)
        let gesture_index06: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DateChangeView.tapGesture(_ :)))
        selectedDayNoticView_index06.tag = 6
        selectedDayNoticView_index06.isUserInteractionEnabled = true
        selectedDayNoticView_index06.addGestureRecognizer(gesture_index06)
        
        self.initSelf()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    func loadNib(){
        let view = Bundle.main.loadNibNamed("DateChangeView", owner:self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    // MARK: - ユーザーアクション
    @objc func tapGesture(_ sender: UITapGestureRecognizer){
        let gesture:UITapGestureRecognizer = sender
        let noticView:UIImageView = gesture.view as! UIImageView
            if (noticView.tag == 0)  {
                selectedDayIndex = 0
                self.initSelf()
            }
            if (noticView.tag == 1)  {
                selectedDayIndex = 1
                self.initSelf()
            }
            if (noticView.tag == 2)  {
                selectedDayIndex = 2
                self.initSelf()
            }
            if (noticView.tag == 3)  {
                selectedDayIndex = 3
                self.initSelf()
            }
            if (noticView.tag == 4)  {
                selectedDayIndex = 4
                self.initSelf()
            }
            if (noticView.tag == 5)  {
                selectedDayIndex = 5
                self.initSelf()
            }
            if (noticView.tag == 6)  {
                selectedDayIndex = 6
                self.initSelf()
            }
        self.delegate?.handleSelectedDay()
    }
    // MARK: - 機能
    func initSelf() {
        businessDatesData = []
        let dates = DateManager.getTermDays(baseDate:Date(), term:7)
            for date in dates {
                let bizData:DateData = DateData()
                bizData.date = date
                bizData.dayOfWeek = DateManager.getDayOfWeek(dateStr: date)
                businessDatesData.append(bizData)
            }
        //日にち、曜日の更新
        let bizDate0:DateData = businessDatesData[0]
        dayOfWeekLb_index0.text = bizDate0.dayOfWeek
        day_index0.text = DateManager.getFormatDate(dateStr:bizDate0.date!, format: DateFormat.DAY)
        
        let bizDate01:DateData = businessDatesData[1]
        dayOfWeekLb_index01.text = bizDate01.dayOfWeek
        day_index01.text = DateManager.getFormatDate(dateStr:bizDate01.date!,format: DateFormat.DAY)
        
        let bizDate02:DateData = businessDatesData[2]
        dayOfWeekLb_index02.text = bizDate02.dayOfWeek
        day_index02.text = DateManager.getFormatDate(dateStr:bizDate02.date!,format: DateFormat.DAY)
        
        let bizDate03:DateData = businessDatesData[3]
        dayOfWeekLb_index03.text = bizDate03.dayOfWeek
        day_index03.text = DateManager.getFormatDate(dateStr:bizDate03.date!,format: DateFormat.DAY)
        
        let bizDate04:DateData = businessDatesData[4]
        dayOfWeekLb_index04.text = bizDate04.dayOfWeek
        day_index04.text = DateManager.getFormatDate(dateStr:bizDate04.date!,format: DateFormat.DAY)
        
        let bizDate05:DateData = businessDatesData[5]
        dayOfWeekLb_index05.text = bizDate05.dayOfWeek
        day_index05.text = DateManager.getFormatDate(dateStr:bizDate05.date!,format: DateFormat.DAY)
        
        let bizDate06:DateData = businessDatesData[6]
        dayOfWeekLb_index06.text = bizDate06.dayOfWeek
        day_index06.text = DateManager.getFormatDate(dateStr:bizDate06.date!,format: DateFormat.DAY)
        
        //選択日にちの更新
        if (selectedDayIndex == 0) {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_on")
            day_index0.textColor = UIColor.white
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_off")
            day_index01.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_off")
            day_index02.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_off")
            day_index03.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_off")
            day_index04.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_off")
            day_index05.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_off")
            day_index06.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
        } else if (selectedDayIndex == 1) {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_off")
            day_index0.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_on")
            day_index01.textColor = UIColor.white
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_off")
            day_index02.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_off")
            day_index03.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_off")
            day_index04.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_off")
            day_index05.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_off")
            day_index06.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
        } else if (selectedDayIndex == 2) {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_off")
            day_index0.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_off")
            day_index01.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_on")
            day_index02.textColor = UIColor.white
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_off")
            day_index03.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_off")
            day_index04.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_off")
            day_index05.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_off")
            day_index06.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
        } else if (selectedDayIndex == 3) {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_off")
            day_index0.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_off")
            day_index01.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_off")
            day_index02.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_on")
            day_index03.textColor = UIColor.white
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_off")
            day_index04.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_off")
            day_index05.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_off")
            day_index06.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
        } else if (selectedDayIndex == 4) {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_off")
            day_index0.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_off")
            day_index01.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_off")
            day_index02.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_off")
            day_index03.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_on")
            day_index04.textColor = UIColor.white
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_off")
            day_index05.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_off")
            day_index06.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
        } else if (selectedDayIndex == 5) {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_off")
            day_index0.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_off")
            day_index01.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_off")
            day_index02.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_off")
            day_index03.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_off")
            day_index04.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_on")
            day_index05.textColor = UIColor.white
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_off")
            day_index06.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
        } else {
            selectedDayNoticView_index0.image = UIImage(named: "selectedDayNoticView_off")
            day_index0.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index01.image = UIImage(named: "selectedDayNoticView_off")
            day_index01.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index02.image = UIImage(named: "selectedDayNoticView_off")
            day_index02.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index03.image = UIImage(named: "selectedDayNoticView_off")
            day_index03.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index04.image = UIImage(named: "selectedDayNoticView_off")
            day_index04.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index05.image = UIImage(named: "selectedDayNoticView_off")
            day_index05.textColor = UIColor.hex(toUIColor: "6a6a6a", alpha:1.0)
            selectedDayNoticView_index06.image = UIImage(named: "selectedDayNoticView_on")
            day_index06.textColor = UIColor.white
        }
    }
}



