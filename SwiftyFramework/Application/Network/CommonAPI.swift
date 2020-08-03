//
//  CommonAPI.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/16.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import MoyaSugar

enum CommonAPI {
    case message(parameters: Dictionary<String, Any>)
}

extension CommonAPI: SugarTargetType {
    
    var route: Route {
        switch self {
        case .message:
            return .get("")
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .message(let parameters):
            return URLEncoding() => parameters
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
