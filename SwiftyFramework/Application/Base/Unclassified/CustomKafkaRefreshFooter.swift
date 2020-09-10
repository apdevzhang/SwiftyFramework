//
//  CustomKafkaRefreshFooter.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/8/10.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import KafkaRefresh

class CustomKafkaRefreshFooter: KafkaFootRefreshControl {

    override func setupProperties() {
        super.setupProperties()
    }
    
    override func kafkaDidScroll(withProgress progress: CGFloat, max: CGFloat) {
        
    }
    
    override func kafkaRefreshStateDidChange(_ state: KafkaRefreshState) {
        super.kafkaRefreshStateDidChange(state)
    }

}
