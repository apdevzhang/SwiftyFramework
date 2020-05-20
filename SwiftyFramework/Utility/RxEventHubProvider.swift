//
//  Created by BANYAN on 2020/3/12.
//  Copyright © 2020 BANYAN. All rights reserved.
//
//  Reference RxEventHub by RxSwift Community
//  https://github.com/RxSwiftCommunity/RxEventHub
//  使用`PublishSubject`封装的EventBus

import Foundation

struct SubjectDefaultProvider {
    var id: String
    var data: Any
}

// MARK: - Custom
class EventHubDefaultProvider: RxEventProvider<SubjectDefaultProvider> {}

// MARK: - Data Type
class EventHubDictionaryProvider: RxEventProvider<Dictionary<String, Any>> {}

class EventHubStringProvider: RxEventProvider<String> {}

class EventHubIntProvider: RxEventProvider<Int> {}

class EventHubJSONStringProvider: RxEventProvider<String> {}

// MARK: - 其它声明
/// 登录成功
class EventHubLoginSuccessProvider: RxEventProvider<Void> {}
