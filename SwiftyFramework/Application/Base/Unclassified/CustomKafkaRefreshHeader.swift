//
//  CustomKafkaRefreshHeader.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/8/10.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import KafkaRefresh

class CustomKafkaRefreshHeader: KafkaHeadRefreshControl {

    override func setupProperties() {
        super.setupProperties()
    }
    
    // 进度回调
    override func kafkaDidScroll(withProgress progress: CGFloat, max: CGFloat) {
        
    }
    
    // 状态改变
    override func kafkaRefreshStateDidChange(_ state: KafkaRefreshState) {
        super.kafkaRefreshStateDidChange(state)
    }
    
}
