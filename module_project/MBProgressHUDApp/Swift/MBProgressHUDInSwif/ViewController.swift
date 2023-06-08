//
//  ViewController.swift
//  MBProgressHUDInSwif
//
//  Created by 小口 哲史 on 2017/04/17.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
   var mbph : MBProgressHUD = MBProgressHUD()
   override func viewDidLoad() {
        super.viewDidLoad()
    }
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   }
   @IBAction func handleProgressShowBtn(_ sender: Any) {
      mbph = MBProgressHUD.showAdded(to: self.view, animated: true)
      mbph.bezelView.color = UIColor.black
      mbph.contentColor = UIColor.white
      mbph.detailsLabel.text = "メッセージ１"
      mbph.label.text = "テスト"
      mbph.isUserInteractionEnabled = false
   }
   @IBAction func handleProgressChangeMessageBtn(_ sender: Any) {
      mbph.label.text = "テスト"
      mbph.detailsLabel.text = "メッセージ2"
   }
   @IBAction func handleHiddenProgressBtn(_ sender: Any) {
      MBProgressHUD.hide(for: self.view, animated: true)
   }
}

