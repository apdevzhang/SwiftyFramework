//
//  BaseNavigationController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import Hero

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.delegate = self
        
        self.delegate = self        
        
        navigationConfig()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UI
    
    func navigationConfig() {
        hero.isEnabled = true
        hero.modalAnimationType = .autoReverse(presenting: .fade)
        hero.navigationAnimationType = .autoReverse(presenting: .slide(direction: .left))
        
        navigationBar.isTranslucent = false
        
        navigationBar.barTintColor = .white
        
//        navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor : UIColor.x222222_00,
//            NSAttributedString.Key.font : UIFont.medium18
//        ]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            self.interactivePopGestureRecognizer?.isEnabled = true
            
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {

    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

    }
    
}

