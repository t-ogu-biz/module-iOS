//
//  XibView.swift
//  XibApp
//
//  Created by 小口 哲史 on 2017/11/14.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

protocol XibViewDelegate {
    func handleBtn()
}

class XibView: UIView {
    var delegate: XibViewDelegate?
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("XibView", owner:self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func handleBtn(_ sender: Any) {
        self.delegate?.handleBtn()
    }
}
