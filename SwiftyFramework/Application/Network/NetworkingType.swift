//
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

protocol NetworkingType {
    associatedtype T: TargetType
    
    var provider: OnlineProvider<T> { get }
}

extension NetworkingType {
    // 自定义Plugins，拦截器
    static var plugins: [PluginType] {
        var plugins: [PluginType] = []
        
        plugins.append(networkActivityPlugin)
        
        var loggerConfig = NetworkLoggerPlugin.Configuration()
        loggerConfig.logOptions = .verbose
                        
        plugins.append(NetworkLoggerPlugin(configuration: loggerConfig))
        
        return plugins
    }
    
    // 自定义endpointClosure, 可额外添加Request Header, 修改task等
    static func endpointsClosure<T>(_ xAccessToken: String? = nil) -> (T) -> Endpoint where T: TargetType {
        return { target in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
            
            return endpoint
        }
    }
    
    // 自定义requestClosure，可对request进行进一步修改
    static func endpointResolver() -> MoyaProvider<T>.RequestClosure {
        return { (endpoint, closure) in
            do {
                var request = try endpoint.urlRequest() // endpoint.urlRequest
                request.httpShouldHandleCookies = false
                request.timeoutInterval = 10
                closure(.success(request))
            } catch {
//                closure(.failure(MoyaError.underlying(error, nil)))
                DDLogError(error.localizedDescription)
            }
        }
    }
    
    // 自定义stubClosure，可用来显示离线数据，模拟延迟测试，还有Unit test
    static func APIKeysBasedStubBehaviour<T>(_ target: T) -> Moya.StubBehavior {
        return .never
    }
}


