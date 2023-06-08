//
//  SizeManager.swift
//  
//  Created by 小口 哲史 on 2017/04/12.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//
//
let BASE_SCREEN_SIZE = "4.7"
let BASE_SCREEN_SIZE_AREA:Float = 250125
let BASE_SCREEN_SIZE_HEIGHT:Float = 667
let SCREEN_SIZE_4S = "3.5"
let SCREEN_SIZE_5S = "4.0"
let SCREEN_SIZE_7S = "4.7"
let SCREEN_SIZE_7SPlus = "5.5"
let SCREEN_SIZE_iPhoneX = "5.8"

import UIKit
class SizeManager: NSObject {
    /*
     * 画面の高さを返却するメソッド(ステータスバー + コンテンツ)
     *
     * @methodOf SizeManager
     */
    class func getScreenSizeHeight() -> CGFloat {
        let app = UIScreen.main.bounds.size.height
        return CGFloat(app)
    }
    
    /*
     * 画面の高さを返却するメソッド(コンテンツのみ)
     *
     * @methodOf SizeManager
     */
    class func getAppSizeHeight() -> CGFloat {
        return CGFloat(UIScreen.main.applicationFrame.size.height)
    }
    
    /*
     * 画面の高さを返却するメソッド(ナビゲーションバーを引いたもの)
     *
     * @param: {controller} 呼び出し元のViewController
     * @methodOf SizeManager
     */
    class func getNaviConAppSizeHeight(controller:UIViewController) -> CGFloat {
        let app = UIScreen.main.bounds.size.height
        if (controller.navigationController == nil) {
            return CGFloat(app)
        }
        let navigation = controller.navigationController!.navigationBar.frame.size.height
        return CGFloat(app - navigation)
    }
    
    /*
     * ステータスバー+ナビゲーションバーの高さを返却するメソット
     *
     * @param: {controller} 呼び出し元のViewController
     * @methodOf SizeManager
     */
    class func getStatusBarAndNavi(controller:UIViewController) -> CGFloat {
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        let navBarHeight = controller.navigationController?.navigationBar.frame.size.height
        return CGFloat(statusBarHeight + navBarHeight!)
    }
    
    /*
     * ステータスバー+ナビゲーションバーの高さを返却するメソット
     *
     * @param: {controller} 呼び出し元のViewController
     * @methodOf SizeManager
     */
    class func getTabberHeight(controller:UIViewController) -> CGFloat {
        return CGFloat(controller.tabBarController!.tabBar.frame.size.height)
        
    }
    /*
     * 複数画面対応_文字サイズを返却するメソッド
     *
     * @param: {fontSize} interfaceBuilderで指定した基準の文字サイズ
     * @methodOf SizeManager
     */
    class func getFontSize(fontSize:CGFloat) -> CGFloat {
        let currentSize:String = UIDevice.getScreenSize()
        var resize:CGFloat
            if (currentSize == BASE_SCREEN_SIZE || currentSize == SCREEN_SIZE_iPhoneX) {
                resize = fontSize
            } else {
                let r:CGRect = UIScreen.main.bounds
                let currentSizeArea = r.size.height * r.size.width
                let magnification = currentSizeArea / CGFloat(BASE_SCREEN_SIZE_AREA)
                resize = fontSize * magnification * CGFloat(1.0)
            }
        let font = UIFont.systemFont(ofSize:resize)
        return font.pointSize
    }
    
    /*
     * 複数画面対応_オブジェクト:UIFontを返却するメソッド
     *
     * @param: {fontSize} interfaceBuilderで指定した基準の文字サイズ
     * @methodOf SizeManager
     */
    class func getFont(fontSize:CGFloat) -> UIFont {
        let currentSize = UIDevice.getScreenSize()
        let resize:CGFloat
            if (currentSize == BASE_SCREEN_SIZE || currentSize == SCREEN_SIZE_iPhoneX) {
                resize = fontSize
            } else {
                let r:CGRect = UIScreen.main.bounds
                let currentSizeArea = r.size.height * r.size.width
                let magnification = currentSizeArea / CGFloat(BASE_SCREEN_SIZE_AREA)
                resize = fontSize * magnification * CGFloat(1.0)
            }
        return UIFont.systemFont(ofSize:resize)
    }
    
    /*
     * 複数画面対応_オブジェクトの高さを返却するメソッド
     *
     * @param: {height} interfaceBuilderで指定した基準の高さ
     * @methodOf SizeManager
     */
    class func getObjectSizeHeight(baseHeight:CGFloat) -> CGFloat {
        let currentSize = UIDevice.getScreenSize()
        let resize:CGFloat
        if (currentSize == BASE_SCREEN_SIZE || currentSize == SCREEN_SIZE_iPhoneX) {
            resize = baseHeight
        } else {
            let r:CGRect = UIScreen.main.bounds
            let currentSizeHeight:CGFloat = r.size.height
            let magnification:CGFloat = currentSizeHeight / CGFloat(BASE_SCREEN_SIZE_HEIGHT)
            resize = baseHeight * magnification * CGFloat(1.0)
        }
        return resize
    }
}



