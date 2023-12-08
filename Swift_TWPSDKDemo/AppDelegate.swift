//
//  AppDelegate.swift
//  Swift_TWPSDKDemo
//
//  Created by San on 10/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window?.rootViewController =  MainViewController()
        self.window?.backgroundColor = .white;
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

