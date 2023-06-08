//
//  UITextField + UIDatePicker.swift
//  PickerViewApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class UITextField___UIDatePicker: UITextField,UITextFieldDelegate {
    let tp:UIDatePicker = UIDatePicker()
    var selectedTime:String = "00:00"
    var isInit:Bool = true
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //撮影時間入力フィールド
            if (isInit) {
                self.delegate = self
                self.borderStyleNone(withBorderWidth:1.0, borderColor:UIColor.blue, radius: 5.5, fontSize:SizeManager.getFontSize(fontSize: (self.font?.pointSize)!), textColor:nil, backgroundColor:nil, leftPadding:0.0)
                self.text = "00:00"
            } else {
                self.text = selectedTime
            }
        //時間選択ピッカー
        tp.datePickerMode = UIDatePickerMode.time
        tp.locale = Locale(identifier: "ja")
        tp.addTarget(self, action:#selector(self.updateTextTime(sender:)), for:UIControlEvents.valueChanged)
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var date:Date = Date()
            if (isInit) {
                date = dateFormatter.date(from:"0:00")!
            } else {
                date = dateFormatter.date(from:selectedTime)!
            }
        tp.setDate(date, animated:true)
        self.inputView = tp
        //ピッカー操作ビュー
        let spacer:UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
        let keybordDoneButtonView_time:UIToolbar = UIToolbar()
        keybordDoneButtonView_time.barStyle = UIBarStyle.black
        keybordDoneButtonView_time.isTranslucent = true
        keybordDoneButtonView_time.tintColor = nil
        keybordDoneButtonView_time.sizeToFit()
        let timeDoneButton:UIBarButtonItem = UIBarButtonItem.init(title: "完了", style:UIBarButtonItemStyle.plain, target: self, action:#selector(self.timePickerDoneClicked))
        let timeCancelButton:UIBarButtonItem = UIBarButtonItem.init(title: "キャンセル", style:UIBarButtonItemStyle.plain, target: self, action:#selector(self.timePickerCancelClicked))
        keybordDoneButtonView_time.setItems([timeCancelButton,spacer,timeDoneButton], animated:false)
        self.inputAccessoryView = keybordDoneButtonView_time
        
        isInit = false
    }
    
    @objc func updateTextTime(sender:Any) {
        print("updateTextTime")
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "HH:mm"
        self.text = df.string(from:tp.date)
    }
    
    @objc func timePickerDoneClicked() {
        print("timePickerDoneClicked")
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "HH:mm"
        selectedTime = df.string(from:tp.date)
        self.resignFirstResponder()
    }
    
    @objc func timePickerCancelClicked() {
        print("timePickerCancelClicked")
        self.text = selectedTime
        self.delegate = self
        self.inputView = tp
        self.resignFirstResponder()
    }
    
}
