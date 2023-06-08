//
//  MuiltFunctionTabBarController.swift
//  TabbedApplication
//
//  Created by 小口 哲史 on 2017/05/17.
//  Copyright © 2017年 小口 哲史. All rights reserved.
//

import UIKit

class MuiltFunctionTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タブバーカスタマイズ
        tabBar.items![2].image = UIImage(named: "third.png")!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tabBar.items![2].title = "third"
        //tabBar.items![2].selectedImage = UIImage(named: "third.png")
        UITabBar.appearance().tintColor = UIColor.red
        UITabBar.appearance().barTintColor = UIColor.blue
        
        let nc:NotificationCenter = NotificationCenter.default
        nc.removeObserver(self)
        nc.addObserver(self, selector: #selector(self.segueFirst02View), name: NSNotification.Name(rawValue: LOCAL_NOTIFICATION_SUGUE_FIRST_02_VIEW), object: nil)
        nc.addObserver(self, selector: #selector(self.segueFirstRootView), name:NSNotification.Name(rawValue: LOCAL_NOTIFICATION_SUGUE_FIRST_ROOT_VIEW), object: nil)
        nc.addObserver(self, selector: #selector(self.segueSecond02View), name: NSNotification.Name(rawValue:LOCAL_NOTIFICATION_SUGUE_SECOND_02_VIEW), object: nil)
        nc.addObserver(self, selector: #selector(self.segueSecondRootView), name: NSNotification.Name(rawValue:LOCAL_NOTIFICATION_SUGUE_SECOND_ROOT_VIEW), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueFirst02View(){
        let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "First_02ViewController") as! First_02ViewController
        selectedIndex = 0
        (viewControllers?[0] as? UINavigationController)?.pushViewController(vc, animated: true)
    }
    func segueFirstRootView() {
        selectedIndex = 0
        let nvc:UINavigationController = (viewControllers?[0] as? UINavigationController)!
        nvc.popToRootViewController(animated: true)
    }
    func segueSecond02View() {
        let storybord:UIStoryboard = UIStoryboard(name:"Main",bundle:nil)
        let vc = storybord.instantiateViewController(withIdentifier:"Second_02ViewController") as! Second_02ViewController
        selectedIndex = 1
        (viewControllers?[1] as? UINavigationController)?.pushViewController(vc, animated: true)
    }
    func segueSecondRootView() {
        selectedIndex = 1
        let nvc:UINavigationController = (viewControllers?[1] as? UINavigationController)!
        nvc.popToRootViewController(animated: true)
    }
}
