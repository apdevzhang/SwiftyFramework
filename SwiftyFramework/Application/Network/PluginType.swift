//
//  MoyaPluginType.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//


import Moya
import Alamofire

public let networkActivityPlugin = NetworkActivityPlugin { (change,_)  -> () in
    switch(change){
    case .began:
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    case .ended:
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

public final class ServiceErrorPlugin: PluginType {
    
    public func willSend(_ request: RequestType, target: TargetType) {
        
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .failure(let moyaError):
            let moyaError = moyaError as MoyaError
            switch moyaError {
            case .statusCode(let response):
                ServiceErrorManager.shared.errorResponse.onNext(ServiceErrorResponse(status: response.statusCode))
                break
            case .underlying(let error as NSError, let response):
                ServiceErrorManager.shared.errorResponse.onNext(ServiceErrorResponse(status: error.code))
                break
            default:
                break
            }
        default:
            break
        }
    }
    
}
