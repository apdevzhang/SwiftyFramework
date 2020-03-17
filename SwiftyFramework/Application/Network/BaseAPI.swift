//
//  BaseAPI.swift
//  Apus
//
//  Created by BANYAN on 2019/8/5.
//  Copyright © 2019 Apus. All rights reserved.
//

import UIKit
import Moya

struct BaseAPI {
    static var baseURL: URL {
        #if DEBUG
            return URL(string: "")!
        #else
            return URL(string: "")!
        #endif
    }
    
    static var headers: [String: String]? {
        var headers = Dictionary<String, String>()
//        headers["Content-Type"] = "application/json"
//        headers["app_version"] = "1.6.4"
//        headers["Authorization"] = UserDefaultConfig.token
        return headers
    }
}

