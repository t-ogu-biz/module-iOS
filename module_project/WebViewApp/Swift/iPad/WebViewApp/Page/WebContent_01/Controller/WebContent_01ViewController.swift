//
//  WebContent_01ViewController.swift
//  WebViewApp
//
//  Created by 小口 哲史 on 2018/02/07.
//  Copyright © 2018年 小口 哲史. All rights reserved.
//

import UIKit

class WebContent_01ViewController: CommonViewController ,UIWebViewDelegate,Browser0perationViewDelegate {
    @IBOutlet weak var wv: UIWebView!
    @IBOutlet weak var browser0perationView: UIView!
    var operationView:Browser0perationView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showMBProgress(label: "読み込み中", detailLabel:"")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.wvInit()
        self.operationViewInit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func wvInit() {
        wv.mediaPlaybackRequiresUserAction = false
        wv.scrollView.bounces = false
        wv.delegate = self
        let url: URL = URL(string:"https://www.apple.com/iphone/")!
        //let url: URL = URL(string:"https://zozo.jp/_member/login.html?bkurl=%2F%3F")!
        //let url: URL = URL(string:"https://qiita.com/happy_ryo/items/6b3830edfac8fa099c4c")!
        let request: URLRequest = URLRequest(url:url)
        wv.loadRequest(request)
    }
    
    func operationViewInit() {
        let width:CGFloat = self.view.bounds.width;
        let height:CGFloat = self.view.bounds.height
        operationView = Browser0perationView(frame:CGRect(x:0, y:0, width:width, height:height))
        operationView?.delegate = self
        browser0perationView.addSubview(operationView!)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        self.showMBProgress(label: "読み込み中", detailLabel:"")
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.dismissMBProgress()
        let title:String? = wv.stringByEvaluatingJavaScript(from:"document.title")
            if NillChecker.isNill(object:title as AnyObject?) {
                self.navigationController?.title = ""
            } else {
                self.navigationItem.title = title
            }
    }
    
    func testHandle() {
        print("testHandle!")
    }
    
    func nextHandle() {
        print("nextHandle!")
         wv.goForward()
    }
    
    func reloadHandle() {
        print("reloadHandle!")
        wv.reload()
    }
    
    func stopHandle() {
        print("stopHandle!")
        self.dismissMBProgress()
        wv.stopLoading()
    }
    
    func backHandle() {
        print("backHandle")
        wv.goBack()
    }
    
}

