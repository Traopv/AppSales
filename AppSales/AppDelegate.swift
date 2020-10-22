//
//  AppDelegate.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white

        let welcome = LoginViewController.init()
        let nav = UINavigationController(rootViewController: welcome)
        window?.rootViewController = nav

        window?.makeKeyAndVisible()
        
        return true
    }
}
