//
//  SectionType.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import RxDataSources

struct SectionType<T> {
    var header: String
    var items: [T]
}

extension SectionType: SectionModelType {
    typealias Item = T
    
    init(original: SectionType, items: [T]) {
        self = original
        self.items = items
    }
}
