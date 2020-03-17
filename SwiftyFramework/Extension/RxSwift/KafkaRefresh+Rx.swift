//
//  KafkaRefresh+Rx.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 7/24/18.
//  Copyright © 2018 Khoren Markosyan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import KafkaRefresh

extension Reactive where Base: KafkaRefreshControl {

    public var isAnimating: Binder<Bool> {
        return Binder(self.base) { refreshControl, active in
            if active {
                // 打开会多次调用刷新
//                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }
    }
}
