//
//  AppDelegate.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Reachability
import CocoaLumberjack
import KafkaRefresh

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var reachability: Reachability?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = BaseNavigationController(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        
        KafkaRefreshDefaults.standard()?.headDefaultStyle = .replicatorCircle
        
        reachability = Reachability()
        try? reachability?.startNotifier()

        CocoaLumberjackManager.shared.configuration()
        
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
}

