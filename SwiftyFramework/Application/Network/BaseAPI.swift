//
//  BaseAPI.swift
//  Apus
//
//  Created by BANYAN on 2019/8/5.
//  Copyright © 2019 Apus. All rights reserved.
//

struct BaseAPI {
    
    static var baseURL: URL {
        #if DEBUG
            return URL(string: "http://app.swifty.debug.cn")!
        #elseif PRODUCT
            return URL(string: "http://app.swifty.product.cn")!
        #else
            return URL(string: "http://app.swifty.release.cn")!
        #endif
    }
    
    static var headers: [String: String]? {
        var headers = Dictionary<String, String>()
        headers["Content-Type"] = "application/json"
        headers["app-version"] = RxAppState.currentAppVersion
        //        headers["access-token"] = UserDataManager.shared.user.accessToken
        return headers
    }
    
}

