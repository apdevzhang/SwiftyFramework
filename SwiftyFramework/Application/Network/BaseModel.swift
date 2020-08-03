//
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import ObjectMapper

class BaseModel: Mappable {
    
    var status: Int?
    var message: String?
    var data: Any?
    
    var version: String?
    var pageNum: Int?
    var pageSize: Int?
    var pages: Int?
    
    var success: Bool {
        return status == 200
    }
    
    /// 是否为第一页
    var isFirstPage: Bool {
        get {
            return pageNum! <= 1
        }
    }
    
    /// 是否为最后一页
    var isLastPage: Bool {
        get {
            return pageNum == pages
        }
    }
    
    init(){}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        status <- map["code"]
        message <- map["msg"]
        version <- map["version"]        
        pageNum <- map["pageNum"]
        pageSize <- map["pageSize"]
        pages <- map["pages"]
    }
    
}

