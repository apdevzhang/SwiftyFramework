//
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import ObjectMapper

// 服务端返回错误信息
enum APIError: Error {
    case serverError(response: ErrorResponse)
}

struct ErrorResponse: Mappable {
       
    var message: String?
    var code: Int?
    var version: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        message <- map["msg"]
        code <- map["code"]
        version <- map["version"]
    }
}
