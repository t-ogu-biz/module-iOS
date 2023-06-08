//
//  ViewController.swift
//  MultipleFunctionDialogApp
//
//  Created by 小口 哲史 on 2017/12/21.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DialogFunctionDelegate {
    var dialog:ShowPopup? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.showDialog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showDialog() {
        dialog = ShowPopup.init(baseViewController:self)
        dialog?.closeBtnEnabled = true
        let function:DialogFunction = DialogFunction()
        function.delegate = self
        dialog?.showPopup(function)
    }

    func willDismissPopup() {
        print("willDismissPopup")
    }
    
    @IBAction func handleShowDialog(_ sender: Any) {
        self.showDialog()
    }
}

