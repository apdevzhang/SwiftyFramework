source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

target 'SwiftyFramework' do
  
  use_frameworks!
  inhibit_all_warnings!
  
  # Rx
  pod 'RxSwift', '~> 5.0'                   # https://github.com/ReactiveX/RxSwift
  pod 'RxCocoa', '~> 5.0'
  pod 'RxFlow', '2.8.0'                     # https://github.com/RxSwiftCommunity/RxFlow
  pod 'NSObject+Rx', '~> 5.0'               # https://github.com/RxSwiftCommunity/NSObject-Rx
  pod 'RxDataSources', '~> 4.0'             # https://github.com/RxSwiftCommunity/RxDataSources
  pod 'RxSwiftExt', '~> 5.0'                # https://github.com/RxSwiftCommunity/RxSwiftExt
  pod 'RxGesture', '~> 3.0'                 # https://github.com/RxSwiftCommunity/RxGesture
  pod 'RxAlertController', '~> 5.0'         # https://github.com/evgeny-sureev/RxAlertController
  pod 'RxWebKit', '~> 1.0'                  # https://github.com/RxSwiftCommunity/RxWebKit
  pod "RxAppState", '~> 1.6.0'              # https://github.com/pixeldock/RxAppState
  pod 'RxKeyboard', '1.0.0'                 # https://github.com/RxSwiftCommunity/RxKeyboard
  pod 'RxReachability'                      # https://github.com/RxSwiftCommunity/RxReachability
  
  
  # Networking
  pod 'Alamofire', '~> 5.0.0-rc.2'          # https://github.com/Alamofire/Alamofire
  pod 'Moya/RxSwift', '14.0.0-beta.2'       # https://github.com/Moya/Moya
  pod 'MoyaSugar/RxSwift'                   # https://github.com/devxoul/MoyaSugar
  
  
  # JSON
  #‘Moya-ObjectMapper/RxSwift’依赖‘Moya/RxSwift版本14.0.0-beta.2’，需要先行安装后者
  pod 'Moya-ObjectMapper/RxSwift', :git => 'https://github.com/khoren93/Moya-ObjectMapper.git', :branch => 'moya14'                   # https://github.com/ivanbruel/Moya-ObjectMapper

  # 日志
  pod 'CocoaLumberjack/Swift', '~> 3.6.0'      # https://github.com/CocoaLumberjack/CocoaLumberjack
  
  
  # UI
  pod 'SnapKit', '~> 5.0'                    # https://github.com/SnapKit/SnapKit
  pod 'Kingfisher', '~> 5.0'                 # https://github.com/onevcat/Kingfisher
  pod 'DZNEmptyDataSet', '~> 1.8.1'          # https://github.com/dzenbot/DZNEmptyDataSet
  pod 'KafkaRefresh', '~> 1.4.7'             # https://github.com/OpenFeyn/KafkaRefresh
  pod 'IQKeyboardManagerSwift', '~> 6.0'     # https://github.com/hackiftekhar/IQKeyboardManager
  pod 'Toast-Swift'                          # https://github.com/scalessec/Toast-Swift
  pod 'WhatsNewKit', '~> 1.0'                # https://github.com/SvenTiigi/WhatsNewKit
  pod 'Hero', '~> 1.4.0'                     # https://github.com/lkzhao/Hero
  pod 'FSPagerView', '~> 0.8.3'              # https://github.com/WenchaoD/FSPagerView
  
  
  # Code Quality
  pod 'Then'                                 # https://github.com/devxoul/Then
  pod 'SwifterSwift', '~> 5.0'               # https://github.com/SwifterSwift/SwifterSwift
  pod 'R.swift', '~> 5.0.0'                  # https://github.com/mac-cain13/R.swift
  pod 'DeviceKit', '~> 2.0'                  # https://github.com/devicekit/DeviceKit
  
  # Not Classified
  
  # Social
  pod 'MonkeyKing', '~> 1.16.0'              # https://github.com/nixzhu/MonkeyKing
  pod 'UMCCommon'
  pod 'UMCAnalytics'
  pod 'WechatOpenSDK'
  pod 'AlipaySDK-iOS'
end

target 'SwiftyFrameworkTests' do
  pod 'Quick', '~> 2.0'  # https://github.com/Quick/Quick
  pod 'Nimble', '~> 8.0'  # https://github.com/Quick/Nimble
  pod 'RxAtomic', :modular_headers => true
  pod 'RxBlocking'  # https://github.com/ReactiveX/RxSwift
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['ENABLE_TESTABILITY'] = 'YES'
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end

