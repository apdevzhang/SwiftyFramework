//
//  ReachabilityManager.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import RxSwift
import Reachability

// Usage:
//    ReachabilityManager.shared.reach
//        .subscribe(onNext: { (isConnect) in
//        DDLogInfo("isConnect: \(isConnect)")
//    }).disposed(by: rx.disposeBag)

class ReachabilityManager: NSObject {
    
    static let shared = ReachabilityManager()

    var reach: Observable<Bool> {
        return Reachability.rx.isReachable
    }
    
}
