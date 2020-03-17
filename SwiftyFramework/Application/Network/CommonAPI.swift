//
//  CommonAPI.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/16.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import MoyaSugar

enum CommonAPI {
    case message(parameters: Dictionary<String, Any>)
    
    case banner(parameters: Dictionary<String, Any>)
    
    case announcement(parameters: Dictionary<String, Any>)
}

extension CommonAPI: SugarTargetType {
    
    var route: Route {
        switch self {
        case .message:
            return .post("/appApi/appNotify/notifyList")
        case .banner:
            return .post("/appApi/bannerApp/list")
        case .announcement:
            return .post("/appApi/appPolicy/list")
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .message(let parameters):
            return JSONEncoding() => parameters
        case .banner(let parameters):
            return JSONEncoding() => parameters
        case .announcement(let parameters):
            return JSONEncoding() => parameters
        }
    }
    
    var sampleData: Data {
        return "sampleData".data(using: String.Encoding.utf8)!
    }
    
    var baseURL: URL {
        return BaseAPI.baseURL
    }
    
    var headers: [String : String]? {
        return BaseAPI.headers
    }
    
}
