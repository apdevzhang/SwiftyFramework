source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

target 'SwiftyFramework' do
  
  use_frameworks!
  inhibit_all_warnings!
  
  # Rx 受限于Moya暂时未更新至6.1.0
  pod 'RxSwift', '~> 5.0'                   # https://github.com/ReactiveX/RxSwift
  pod 'RxCocoa', '~> 5.0'
  pod 'RxSwiftExt', '~> 5.0'                # https://github.com/RxSwiftCommunity/RxSwiftExt
  pod 'NSObject+Rx', '~> 5.0'               # https://github.com/RxSwiftCommunity/NSObject-Rx
  pod 'RxDataSources', '~> 4.0'             # https://github.com/RxSwiftCommunity/RxDataSources
  pod 'RxGesture', '~> 3.0'                 # https://github.com/RxSwiftCommunity/RxGesture
  pod 'RxWebKit', '~> 1.0'                  # https://github.com/RxSwiftCommunity/RxWebKit
  pod 'RxReachability', '1.1.0'                      # https://github.com/RxSwiftCommunity/RxReachability
  
  # Networking
  pod 'Alamofire', '5.4.2'          # https://github.com/Alamofire/Alamofire
  pod 'Moya/RxSwift', '14.0'       # https://github.com/Moya/Moya
  pod 'MoyaSugar/RxSwift'                   # https://github.com/devxoul/MoyaSugar
  
  
  # JSON
  pod 'Moya-ObjectMapper/RxSwift'   # https://github.com/bmoliveira/Moya-ObjectMapper

  
  # 日志
  pod 'CocoaLumberjack/Swift', '3.6.0'      # https://github.com/CocoaLumberjack/CocoaLumberjack
  
  
  # UI
  pod 'SnapKit', '~> 5.0'                    # https://github.com/SnapKit/SnapKit
  pod 'Kingfisher', '~> 5.0'                 # https://github.com/onevcat/Kingfisher
  pod 'DZNEmptyDataSet', '~> 1.8.1'          # https://github.com/dzenbot/DZNEmptyDataSet
  pod 'KafkaRefresh', '~> 1.4.7'             # https://github.com/OpenFeyn/KafkaRefresh
  pod 'IQKeyboardManagerSwift', '~> 6.0'     # https://github.com/hackiftekhar/IQKeyboardManager
  pod 'Toast-Swift'                          # https://github.com/scalessec/Toast-Swift
  pod 'Hero', '~> 1.4.0'                     # https://github.com/lkzhao/Hero
  pod 'FSPagerView', '~> 0.8.3'              # https://github.com/WenchaoD/FSPagerView
  
  
  # Code Quality
  pod 'Then'                                 # https://github.com/devxoul/Then
  pod 'SwifterSwift', '~> 5.0'               # https://github.com/SwifterSwift/SwifterSwift
  pod 'DeviceKit', '~> 2.0'                  # https://github.com/devicekit/DeviceKit
  pod 'R.swift', '~> 5.0.0'                  # https://github.com/mac-cain13/R.swift
  
  # Social
  pod 'MonkeyKing', '~> 1.16.0'              # https://github.com/nixzhu/MonkeyKing
  
end

target 'SwiftyFrameworkTests' do
  pod 'Quick', '~> 2.0'  # https://github.com/Quick/Quick
  pod 'Nimble', '~> 8.0'  # https://github.com/Quick/Nimble
  pod 'RxAtomic', :modular_headers => true
  pod 'RxBlocking', '~> 5.0'  # https://github.com/ReactiveX/RxSwift
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

