//
//  CommonViewController.swift
//
//  Created by 小口哲史 on 2017/05/09.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
enum NaviBarType {
    case CUSTOM_NAVIBAR_BASIC
    case CUSTOM_NAVIBAR_NONE
}

class CommonViewController:UIViewController {
    var nonFrontViewControllerFlag:Bool = false
    var mbph:MBProgressHUD? = nil
    var refreshControl:UIRefreshControl! = nil
    var navibaraType:NaviBarType = NaviBarType.CUSTOM_NAVIBAR_BASIC
    var isBgColorDefult = false
    var noneLogout = false
    var retainAlert:UIAlertController? = nil
    var isConnecting:Bool = false
    // MARK: - 画面コントローラーライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            if !self.nonFrontViewControllerFlag {
                appDelegate.frontOfViewController = CommonViewController.self
            }
            if (isBgColorDefult) {
                view.backgroundColor = UIColor.hex(toUIColor:COLOR_APP_DEFULT, alpha: 1.0)
            }
        self.defineNavigationBarColor()
            if (!noneLogout) {
                let logoutBtn = UIBarButtonItem(title: "ログアウト", style: .plain, target: self, action: #selector(CommonViewController.handleLogoutBtn))
                navigationItem.rightBarButtonItem = logoutBtn
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
    func defineThisClassNotFrontViewController() {
        self.nonFrontViewControllerFlag = true
    }
    // MARK: - ナビゲーションコントローラー関連
    func defineNavigationBarColor() {
        if (navibaraType == NaviBarType.CUSTOM_NAVIBAR_BASIC) {
            self.navigationController?.navigationBar.barTintColor = UIColor.hex(toUIColor: "009CFF", alpha:1.0)
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
    }
    func hidesBackButton(vc:UIViewController ,hide:Bool) {
        if (hide) {
            vc.navigationItem.hidesBackButton = true
        } else {
            vc.navigationItem.hidesBackButton = false
        }
    }
    /*
    func hidesRightButton() {
        self.navigationController?.navigationItem.rightBarButtonItem = nil
    }
    */
    func modalTransitonTo(vc:UIViewController) {
        /*
         let nc:UINavigationController = UINavigationController(rootViewController:vc)
         nc.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        */
        self.present(vc, animated: true, completion: nil)
    }
    // MARK: - 通信関連
    func isReachable() -> Bool {
        let reachability:Reachability = Reachability(hostName: "ドメイン")
        let status:NetworkStatus = reachability.currentReachabilityStatus()
        return !(status == NotReachable)
    }
    // MARK: - プログレス関連
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
        mbph?.bezelView.color = UIColor.gray
        mbph?.contentColor = UIColor.white
        mbph?.detailsLabel.text = detailLabel
        mbph?.label.text = label
        mbph?.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha:0.2)
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
    // MARK: - テーブルビュー関連
    func addRefreshControllerWithTableView(tableView:UITableView) {
        print("addRefreshControllerWithTableView")
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(self.onTableViewRefreshed), for: .valueChanged)
    }
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    @objc func onTableViewRefreshed() {
        //継承先でOverrideして使用する
    }
    // MARK: - その他
    @objc func handleLogoutBtn() {
        /*
        print("handleLogoutBtn_ログアウト処理開始")
        if (isConnecting) {
            print("handleLogoutBtn_ログアウト処理排他")
            showOriginalAlert(showForced: true, originalTitle: "", originaMessage: "他の通信処理が実行中です。\n処理終了後、ログアウトを行なって下さい。")
            return
        }
        if(!isReachable()){
            self.showOriginalAlert(showForced: true, originalTitle: WORD_ERROR_NONE_NETWORK_TITLE, originaMessage: WORD_ERROR_NONE_NETWORK_MESSAGE)
            return
        }
        let postLogoutTask = PostLogoutTask()
        postLogoutTask.requestWithClosures(preTask: {
            self.showMBProgress(label: "ログアウト中", detailLabel: "しばらくお待ち下さい")
        },  postTask: { (dataInfo, error) in
            print("handleLogoutBtn_ログアウト処理終了")
            self.dismissMBProgress()
            if (error != nil) {
                self.showErrorAlertWithNSError(error: error! as NSError, showForced: true)
                return
            }
            UserDefaults.standard.set(false, forKey: KEY_USRDEFULT_IS_LOGIN)
            let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            self.present(nextView!, animated:true , completion: nil)
        })
        */
        showMBProgress(label: "ログアウト処理中です", detailLabel: "しばらくお待ち下さい")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismissMBProgress()
            UserDefaults.standard.set(false, forKey: "keyName")
            let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            self.present(nextView!, animated:true , completion: nil)
        }
    }
    func showOriginalAlert(showForced:Bool, originalTitle:String, originaMessage:String) {
            if (!showForced) {
                if (!NillChecker.isNill(object: retainAlert) ) {
                    return
                }
            }
        retainAlert?.dismiss(animated: false, completion: nil)
        retainAlert = UIAlertController(title:originalTitle, message: originaMessage, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
            (action: UIAlertAction!) in
            self.retainAlert = nil
        })
        retainAlert?.addAction(cancel)
        self.present(retainAlert!, animated: true, completion: nil)
    }
    func showErrorAlertWithNSError(error:NSError, showForced:Bool) {
            if (!showForced) {
                if (!NillChecker.isNill(object: retainAlert) ) {
                    return
                }
        }
        var title = error.localizedFailureReason
        var message = error.localizedDescription
            if (NSStringUtil.isNullorEmpty(title)) {
                title = "テスト"
            }
            if (NSStringUtil.isNullorEmpty(message)) {
                message = "テスト"
            }
        retainAlert?.dismiss(animated: false, completion: nil)
        retainAlert = UIAlertController(title:title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: {
            (action: UIAlertAction!) in
            self.retainAlert = nil
        })
        retainAlert?.addAction(cancel)
        self.present(retainAlert!, animated: true, completion: nil)
    }
}

