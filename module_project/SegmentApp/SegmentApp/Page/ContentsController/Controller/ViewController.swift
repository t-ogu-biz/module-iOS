//
//  ViewController.swift
//  SegmentApp
//
//  Created by 小口 哲史 on 2018/01/30.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var c01Vc:Contents_01ViewController = Contents_01ViewController(nibName: "Contents_01ViewController", bundle: nil)
    var c02Vc:Contents_02ViewController = Contents_02ViewController(nibName: "Contents_02ViewController", bundle: nil)
    @IBOutlet var segmentTab: UISegmentedControl!
    @IBOutlet var contentsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Contents_ViewController_viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Contents_ViewController_viewWillAppear")
        
        let alertController = UIAlertController(title: "UIAlertControllerStyle.Alert", message: "iOS8", preferredStyle: .alert)
        let otherAction = UIAlertAction(title: "はい", style: .default) {
            action in NSLog("はいボタンが押されました")
        }
        let cancelAction = UIAlertAction(title: "いいえ", style: .cancel) {
            action in NSLog("いいえボタンが押されました")
        }
        // addActionした順に左から右にボタンが配置されます
        alertController.addAction(otherAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Contents_ViewController_viewDidAppear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        segmentTab.setTitle("Cotents01", forSegmentAt: 0)
        segmentTab.setTitle("Cotents02", forSegmentAt: 1)
        
        c01Vc.view.backgroundColor = UIColor.cyan
        c02Vc.view.backgroundColor = UIColor.magenta
        
        contentsView.addSubview(c02Vc.view)
        contentsView.addSubview(c01Vc.view)
        
        var cotents01Frame:CGRect = c01Vc.view.frame
        cotents01Frame = contentsView.frame
        cotents01Frame.size = contentsView.frame.size
        cotents01Frame.origin.y = 0.0
        c01Vc.view.frame = cotents01Frame
    }
    
    
    @IBAction func handleTab(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            contentsView.bringSubview(toFront: c01Vc.view)
            print("0")
        case 1:
            contentsView.bringSubview(toFront: c02Vc.view)
            print("1")
        default:
            print("")
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        print("reload")
        c01Vc.reload()
    }
    
    @IBAction func segue(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController02") as! ViewController02
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

