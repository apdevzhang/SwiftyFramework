//
//  AppDelegate.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
            
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = BaseNavigationController(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()

        Application.default.configutation()
        
        /// 测试
        Application.default.clearDataPersistence()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        if extensionPointIdentifier.rawValue == "com.apple.keyboard-service" {
            return false
        }
        return true
    }
}


