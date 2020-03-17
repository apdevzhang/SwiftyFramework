//
//  UserDefaultConfig.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/11.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit

struct UserDefaultConfig {
    
    // MARK: - 系统相关
    
    /// 是否第一次登录
    @UserDefault(key: "vrigin", defaultValue: false)
    static var vrigin: Bool
    
    /// 登录成功标识
    @UserDefault(key: "success", defaultValue: false)
    static var success: Bool
    
    // MARK: - 用户相关
    
    /// 用户token
    @UserDefault(key: "token", defaultValue: "")
    static var token: String
}
