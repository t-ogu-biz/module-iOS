//
//  ViewController.swift
//  PickerViewApp
//
//  Created by 小口 哲史 on 2017/12/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var tf: UITextField___UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    @objc func updateTextTime(sender:Any) {
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "HH:mm"
        tf.text = df.string(from:tp.date)
    }
    
    @objc func timePickerDoneClicked() {
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "HH:mm"
        selectedTime = df.string(from:tp.date)
        tf.resignFirstResponder()
    }
    
    @objc func timePickerCancelClicked() {
        tf.text = selectedTime
        tf.delegate = self
        tf.inputView = tp
        tf.resignFirstResponder()
    }
    */
    
    @IBAction func handleSegueSelectedTimeView(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        let vc:SelectedTimeViewViewController = storyboard.instantiateViewController(withIdentifier: "SelectedTimeViewViewController") as! SelectedTimeViewViewController
        vc.selectedTime = tf.selectedTime
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
