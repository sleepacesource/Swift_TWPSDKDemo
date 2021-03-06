//
//  MainViewController.swift
//  Swift_TWPSDKDemo
//
//  Created by San on 12/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.addChildVC(childVC: LoginViewController(), title: NSLocalizedString("login_in", comment: ""), index: 0 ,imagename: "home.png")
        self.addChildVC(childVC: DeviceViewController(), title: NSLocalizedString("device", comment: ""), index: 1 , imagename: "control.png" )
        self.addChildVC(childVC: DataViewController(), title: NSLocalizedString("report_", comment: ""), index: 2 , imagename: "data.png")
        
        if #available(iOS 13.0, *) {
                self.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
            } else {
                // Fallback on earlier versions
            };
    }
    
    func addChildVC(childVC:UIViewController,title:String,index:Int ,imagename: String) {
        let navigation = UINavigationController(rootViewController: childVC)
        childVC.title = title
        childVC.tabBarItem.image = UIImage.init(imageLiteralResourceName: imagename)
        childVC.tabBarItem.tag = index
        childVC.navigationController?.navigationBar.isHidden = true;
        self.addChild(navigation)
    }
}
