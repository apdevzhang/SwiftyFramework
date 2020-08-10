//
//  AppInfo.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/8/6.
//  Copyright © 2020 BANYAN. All rights reserved.
//

enum AppInfoKey {
    static let CFBundleURLTypes = "CFBundleURLTypes"
    static let CFBundleTypeRole = "CFBundleTypeRole"
    static let CFBundleURLName = "CFBundleURLName"
    static let CFBundleURLSchemes = "CFBundleURLSchemes"
}

final class AppInfo {
    
    static let shared = AppInfo()
    
    
    // MARK: - Properties
    
    var infoDictionary: [String: Any] {
        return Bundle.main.infoDictionary!
    }
    
    var urlTypes: [NSDictionary] {
        return infoDictionary[AppInfoKey.CFBundleURLTypes] as! [NSDictionary]
    }
    
    // MARK:  Custom
    
    // baseApi、
    
    
    // MARK:  System
    
    // landSpace
    
}
