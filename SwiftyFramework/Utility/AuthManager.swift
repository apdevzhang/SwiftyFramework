//
//  AuthManager.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/11.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit

class AuthManager: NSObject {
    
    static let shared = AuthManager()
    
    // MARK: - Properties
    var loginNecessary: Bool = false
    
    // MARK: - Public Methods
    
    /// `token`失效操作
    func removeToken() {
//        if loginNecessary {
//            switchRootViewController(LoginViewController())
//        } else {
//            UIApplication.shared.keyWindow?.rootViewController?.present(LoginViewController(), animated: true, completion: {
//
//            })
//        }
    }
    
    /// `token`有效操作
    func validToken(_ viewController: UIViewController) {        
//        if loginNecessary {
//            switchRootViewController(BaseNavigationController(rootViewController: ExampleViewController()))
//        } else {
//            viewController.dismiss(animated: true) {
//                
//            }
//        }
    }
    
    // MARK: - Private Methods
    
    /// 切换根控制器
    private func switchRootViewController(_ viewController: UIViewController) {
        UIApplication.shared.keyWindow?.switchRootViewController(to: viewController)
    }
}
