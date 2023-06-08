//
//  SizeManager.swift
//  
//
//  Created by 小口 哲史 on 2017/04/12.
//
//
let BASE_SCREEN_SIZE = "4.7"
let BASE_SCREEN_SIZE_AREA:Float = 181760
let BASE_SCREEN_SIZE_HEIGHT:Float = 568
let SCREEN_SIZE_4S = "3.5"
let SCREEN_SIZE_5S = "4.0"
let SCREEN_SIZE_7S = "4.7"
let SCREEN_SIZE_7SPlus = "5.5"
import UIKit

class SizeManager: NSObject {
    /*
     * 画面の高さを返却するメソッド(ステータスバー + コンテンツ)
     *
     * @methodOf SizeManager
     */
    class func getScreenSizeHeight() -> Float {
        let app = UIScreen.main.bounds.size.height
        return Float(app)
    }
    
    /*
     * 画面の高さを返却するメソッド(コンテンツのみ)
     *
     * @methodOf SizeManager
     */
    class func getAppSizeHeight() -> Float {
        return Float(UIScreen.main.applicationFrame.size.height)
    }
    /*
     * 画面の高さを返却するメソッド(ナビゲーションバーを引いたもの)
     *
     * @param: {controller} 呼び出し元のViewController
     * @methodOf SizeManager
     */
    class func getNaviConAppSizeHeight(controller:UIViewController) -> Float {
        let app = UIScreen.main.bounds.size.height
            if (controller.navigationController == nil) {
                return Float(app)
            }
        let navigation = controller.navigationController!.navigationBar.frame.size.height
        return Float(app - navigation)
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
            if (currentSize == BASE_SCREEN_SIZE) {
                resize = fontSize
            } else {
                let r:CGRect = UIScreen.main.bounds
                let currentSizeArea = r.size.height * r.size.width
                let magnification = currentSizeArea / CGFloat(BASE_SCREEN_SIZE_AREA)
                resize = fontSize * magnification * CGFloat(1.00)
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
            if (currentSize == BASE_SCREEN_SIZE) {
                resize = fontSize
            } else {
                let r:CGRect = UIScreen.main.bounds
                let currentSizeArea = r.size.height * r.size.width
                let magnification = currentSizeArea / CGFloat(BASE_SCREEN_SIZE_AREA)
                resize = fontSize * magnification * CGFloat(1.00)
            }
        return UIFont.systemFont(ofSize:resize)
    }
    
    /*
     * 複数画面対応_オブジェクトの高さを返却するメソッド
     *
     * @param: {height} interfaceBuilderで指定した基準の高さ
     * @methodOf SizeManager
     */
    class func getObjectSizeHeight(height:CGFloat) -> CGFloat {
        let currentSize = UIDevice.getScreenSize()
        let resize:CGFloat
        if (currentSize == BASE_SCREEN_SIZE) {
            resize = height
        } else {
            let r:CGRect = UIScreen.main.bounds
            let currentSizeHeight = r.size.height
            let magnification = currentSizeHeight / CGFloat(BASE_SCREEN_SIZE_HEIGHT)
            resize = height * magnification * CGFloat(1.0)
        }
        return resize
    }
}



