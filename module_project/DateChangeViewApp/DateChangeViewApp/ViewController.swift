//
//  ViewController.swift
//  DateChangeViewApp
//
//  Created by 小口 哲史 on 2017/11/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DateChangeViewDelegate {
    @IBOutlet weak var dateChangeViewSection: UIView!
    var dateChangeView:DateChangeView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        dateChangeView = DateChangeView(frame:CGRect(x:0, y:0, width:dateChangeViewSection.frame.size.width, height:dateChangeViewSection.frame.size.height))
        dateChangeView?.delegate = self
        dateChangeViewSection.addSubview(dateChangeView!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dateChangeView?.initSelf()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func handleSelectedDay() {
        let bizDate:DateData = (dateChangeView?.businessDatesData[(dateChangeView?.selectedDayIndex)!])!
        print("date: " + bizDate.date!)
        print("selectedDayIndex: " + String(describing: dateChangeView?.selectedDayIndex))
    }
}

