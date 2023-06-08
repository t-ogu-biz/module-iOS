//
//  MultipleDialog.swift
//  MultipleDialogApp
//
//  Created by 小口 哲史 on 2017/12/19.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

protocol DialogFunctionDelegate {
    func willDismissPopup()
}

class DialogFunction: UIViewController,ShowPopupDelegate {
    var delegate: DialogFunctionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willDismissPopup() {
        self.delegate?.willDismissPopup()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
