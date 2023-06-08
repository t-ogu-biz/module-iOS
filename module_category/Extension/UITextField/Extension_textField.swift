//
//  Extension_textField.swift
//  Test_customTextField
//
//  Created by 小口 哲史 on 2017/05/05.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit
/*
 * interfaceBuilderで定義したUITextFileオブジェクト(borderStyle:UITextBorderStyleNone)の見た目をカスタマイズするメソッド
 *
 * @param: {borderWidth} 枠線の幅
 * @param: {borderColor} 枠線の色
 * @param: {radius} 角の角度
 * @param: {txtColor} 入力の文字色
 * @param: {bgColor} 背景色
 * @param: {leftPad} 左隅の余白
 *
 * @methodOf UITextField+autoCustom
 */
extension UITextField {
    func borderStyleNoneWithBorderWidth (borderWidth:CGFloat, borderColor:UIColor?, radius:CGFloat?, fontSize:CGFloat, txtColor:UIColor?, bgColor:UIColor?, leftPad:CGFloat?) {
            if borderWidth != 0 {
                self.layer.borderWidth = borderWidth
            }
            if let unwrapBorderColor = borderColor {
                self.layer.borderColor = unwrapBorderColor.cgColor
            }
            if let unwrapRadius = radius {
                self.layer.cornerRadius = unwrapRadius
            }
            if let unwrapBgColor = bgColor {
                self.backgroundColor = unwrapBgColor
            }
            if let unwrapleftPad = leftPad {
                let ltfPvframe:CGRect
                    if leftPad != 0 {
                        ltfPvframe = CGRect(x:0,y:0,width:unwrapleftPad,height:self.frame.size.height)
                    } else {
                        ltfPvframe = CGRect(x:0,y:0,width:5,height:self.frame.size.height)
                    }
                let ltfPv:UIView = UIView.init(frame:ltfPvframe)
                ltfPv.isOpaque = false
                self.leftView = ltfPv
                self.leftViewMode = UITextFieldViewMode.always
            }
            if let unwrapTxtColor = txtColor {
                self.textColor = unwrapTxtColor
            }
            if fontSize != 0 {
                self.font = UIFont.systemFont(ofSize:CGFloat(fontSize))
            }
            if let unwrapleftPad = leftPad {
                self.textAlignment = NSTextAlignment.left
            } else {
                self.textAlignment = NSTextAlignment.center
            }
        self.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.adjustsFontSizeToFitWidth = false
    }
    func setMailCreateTextField(view:UIView, fontSize:CGFloat, color:String, leadLabel:UILabel) {
        let sentDateLbFontSize = SizeManager.getFontSize(fontSize:fontSize)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: leadLabel.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: leadLabel.topAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0).isActive = true
        self.font = UIFont.systemFont(ofSize: sentDateLbFontSize)
        self.textColor = UIColor.hex(toUIColor: color, alpha: 1.0)
        self.borderStyle = .none
    }
}
