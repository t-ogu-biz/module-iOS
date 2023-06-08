//
//  SelectedTimeViewViewController.swift
//  PickerViewApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class SelectedTimeViewViewController: UIViewController {
    @IBOutlet var lb: UILabel!
    var selectedTime:String = "00:00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lb.text = selectedTime
    }
    
}
