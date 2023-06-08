//
//  CommonViewController.swift
//  CommonViewController_test
//
//  Created by 小口哲史 on 2017/05/09.
//  Copyright © 2017年 microwave. All rights reserved.
//

import UIKit
class CommonViewController:UIViewController {
    var nonFrontViewControllerFlag:Bool = false
    var mbph:MBProgressHUD? = nil
    var refreshControl:UIRefreshControl! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            if !self.nonFrontViewControllerFlag {
                appDelegate.frontOfViewController = CommonViewController.self
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismissIndicator()
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: - プログレス関連
    func showIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func dismissIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    func showMBProgress(label:String, detailLabel:String) {
            if !NillChecker.isNill(object:mbph as AnyObject?) {
                MBProgressHUD.hide(for: self.view, animated: true)
                mbph = nil
            }
        mbph = MBProgressHUD()
        mbph = MBProgressHUD.showAdded(to: self.view, animated: true)
        mbph?.bezelView.color = UIColor.black
        mbph?.contentColor = UIColor.white
        mbph?.detailsLabel.text = detailLabel
        mbph?.label.text = label
        mbph?.isUserInteractionEnabled = false
    }
    func updateMBProgressTitle(label:String,detailLabel:String) {
            if NillChecker.isNill(object:mbph as AnyObject?) {
                return
            }
        mbph?.label.text = label;
        mbph?.detailsLabel.text = detailLabel
    }
    func dismissMBProgress() {
            if NillChecker.isNill(object:mbph as AnyObject?) {
                return
            }
        MBProgressHUD.hide(for: self.view, animated: true)
        mbph = nil
    }
    func addRefreshControllerWithTableView(tableView:UITableView) {
        refreshControl = UIRefreshControl()
        //refreshControl.addTarget(self, action: #selector(self.onTableViewRefreshed), for: .valueChanged)
    }
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    func onTableViewRefreshed() {
    }
    func defineNavigationBarColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        //self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    func modalTransitonTo(vc:UIViewController) {
        /*
        let nc:UINavigationController = UINavigationController(rootViewController:vc)
        nc.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        */
        self.present(vc, animated: true, completion: nil)
    }
    func defineThisClassNotFrontViewController() {
         self.nonFrontViewControllerFlag = true
    }
}

