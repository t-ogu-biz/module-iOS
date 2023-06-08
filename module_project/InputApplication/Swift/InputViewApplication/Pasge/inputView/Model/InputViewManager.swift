//
//  InputViewManager.swift
//  InputViewApplication
//
//  Created by 小口 哲史 on 2017/12/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class InputViewManager: NSObject,UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
    var tf:UITextField? = nil
    var tv:UITableView? = nil

    func setNib(tb:UITableView, nibName:String) {
        tb.register(UINib(nibName:nibName, bundle: nil), forCellReuseIdentifier:nibName)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputViewCell") as! InputViewCell
        self.configureCell(cell:cell, indexPath:indexPath)
        return cell
    }
    
    func configureCell(cell:InputViewCell, indexPath:IndexPath) {
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.field_firstName.delegate = self
        cell.field_firstName.tag = 0
        cell.field_lastName.delegate = self
        cell.field_lastName.tag = 1
        cell.field_sheet1.delegate = self
        cell.field_sheet1.tag = 2
        cell.field_sheet2.delegate = self
        cell.field_sheet2.tag = 3
        cell.field_city.delegate = self
        cell.field_city.tag = 4
        cell.field_state.delegate = self
        cell.field_state.tag = 5
        cell.field_zipCode.delegate = self
        cell.field_zipCode.tag = 6
        cell.field_email.delegate = self
        cell.field_email.tag = 7
        cell.fielf_phone.delegate = self
        cell.fielf_phone.tag = 8
        self.registerForKeyboardNotifications()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 667
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tf = textField
        tv?.isScrollEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardDidHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordDidShown(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordWillHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordDidHidden(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object:nil)
    }
    
    @objc func keybordDidShown (notification:NSNotification) {
        if tf!.tag >= 5 {
            let scrollPoint:CGPoint = CGPoint(x:0.0, y:150.0)
            tv?.setContentOffset(scrollPoint, animated:true)
        }
    }
    
    @objc func keybordWillHidden(notification:NSNotification) {
        let scrollPoint:CGPoint = CGPoint(x:0.0, y:0.0)
        tv?.setContentOffset(scrollPoint, animated:true)
    }
    
    @objc func keybordDidHidden(notification:NSNotification) {
        tv?.isScrollEnabled = false
    }
}
