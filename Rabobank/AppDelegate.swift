//
//  AppDelegate.swift
//  Rabobank
//
//  Created by Dennis Skokov on 28/02/2019.
//  Copyright © 2019 Dennis Skokov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let listAssembly = ListAssembly()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if window == nil {
            window = UIWindow()
            window?.makeKeyAndVisible()
        }
        
        window?.rootViewController = listAssembly.createViewController()
        
        return true
    }
}

