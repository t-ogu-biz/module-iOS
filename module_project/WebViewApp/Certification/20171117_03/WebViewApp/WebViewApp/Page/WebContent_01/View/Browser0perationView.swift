//
//  Browser0perationView.swift
//  WebViewApp
//
//  Created by 小口 哲史 on 2017/11/14.
//  Copyright © 2017年 microwave. All rights reserved.
//

import UIKit

protocol Browser0perationViewDelegate {
    func backHandle()
    func nextHandle()
    func reloadHandle()
    func stopHandle()
    func testHandle()
}

class Browser0perationView: UIView {
    var delegate: Browser0perationViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("Browser0perationView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func backHandle(_ sender: Any) {
        self.delegate?.backHandle()
    }
    
    @IBAction func nextHandle(_ sender: Any) {
        self.delegate?.nextHandle()
    }
    
    @IBAction func reloadHandle(_ sender: Any) {
        self.delegate?.reloadHandle()
    }
    
    @IBAction func stopHandle(_ sender: Any) {
        self.delegate?.stopHandle()
    }
    
    @IBAction func testHandle(_ sender: Any) {
        self.delegate?.testHandle()
    }

}
