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
        
        self.addChildVC(childVC: LoginViewController(), title: "登录", index: 0 ,imagename: "home.png")
        self.addChildVC(childVC: DeviceViewController(), title: "设备", index: 1 , imagename: "control.png" )
        self.addChildVC(childVC: DataViewController(), title: "报告", index: 2 , imagename: "data.png")
    }
    
    func addChildVC(childVC:UIViewController,title:String,index:Int ,imagename: String) {
        let navigation = UINavigationController(rootViewController: childVC)
        childVC.title = title
        childVC.tabBarItem.image = UIImage.init(imageLiteralResourceName: imagename)
        childVC.tabBarItem.tag = index
        childVC.navigationController?.navigationBar.isHidden = true;
        self.addChild(navigation)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
