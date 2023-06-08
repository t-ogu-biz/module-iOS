//
//  ViewController.swift
//  XibApp
//
//  Created by 小口 哲史 on 2017/11/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XibViewDelegate {
    var xibview:XibView? = nil
    @IBOutlet weak var xibViewSection: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initXibView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initXibView() {
        let width:CGFloat = xibViewSection.frame.size.width
        let height:CGFloat = xibViewSection.frame.size.height
        xibview = XibView(frame:CGRect(x:0, y:0, width:width, height:height))
        xibViewSection.addSubview(xibview!)
        xibview?.delegate = self
    }
    
    func handleBtn() {
        print("handleBtn")
    }
}

