//
//  AuthenticationAPI.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/16.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import MoyaSugar

enum AuthenticationAPI {
    case login(parameters: Dictionary<String, Any>)
    case register(parameters: Dictionary<String, Any>)
}

extension AuthenticationAPI: SugarTargetType {
    
    /// method + path
    var route: Route {
        switch self {
        case .login:
            return .post("/appApi/appUser/login")
        case .register:
            return .post("/appApi/appUser/register")
        }
    }
    
    /// encoding + parameters
    var parameters: Parameters? {
        switch self {
        case .login(let parameters):
            return JSONEncoding() => parameters
        case .register(let parameters):
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
