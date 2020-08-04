//
//  BaseAPI.swift
//  Apus
//
//  Created by BANYAN on 2019/8/5.
//  Copyright © 2019 Apus. All rights reserved.
//

struct BaseAPI {
    
    static var baseURL: URL {
        let baseURL = URL(string: (Bundle.main.infoDictionary!["APP_BASE_URL"] as! String).replacingOccurrences(of: "\\", with: ""))!
        return baseURL
    }
    
    static var headers: [String: String]? {
        var headers = Dictionary<String, String>()
        headers["Content-Type"] = "application/json"
        headers["app-version"] = RxAppState.currentAppVersion
//        headers["access-token"] = UserDataManager.shared.user.accessToken
        return headers
    }
    
}

