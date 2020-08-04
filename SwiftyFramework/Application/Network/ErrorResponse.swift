//
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import ObjectMapper


// MARK: - Error response for request success

enum APIError: Swift.Error {
    case responseError(response: ErrorResponse)
}

struct ErrorResponse: Mappable {
    
    var message: String?
    var code: Int?
    var version: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        message <- map["msg"]
        code <- map["status"]
        version <- map["version"]
    }
    
}


// MARK: - Error response for request failed

class ServiceErrorManager: NSObject {
    
    static let shared = ServiceErrorManager()
    
    let errorResponse = PublishSubject<ServiceErrorResponse>()
    
}

struct ServiceErrorResponse {
    
    /// 状态码
    var status: Int
       
    var message: String {
        get {
            return convertStatusToMessage(status)
        }
    }
    
    init(status: Int) {
        self.status = status
    }
    
    private func convertStatusToMessage(_ status: Int) -> String {
        switch status {
        case 13:
            // -1009
            return "网络连接失败"
        case 14:
            return "无法连接服务器"
        case 500:
            return "服务器错误，无法连接"
        case 502:
            return "服务器网关错误"
        case 503:
            return "服务不可用"
        case 504:
            return "网关超时"
        default:
            return "未知错误"
        }
    }
    
}
