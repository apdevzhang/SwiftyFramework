source 'https://github.com/CocoaPods/Specs.git'


platform :ios, '13.0'

target 'SwiftyFramework' do
  
  use_frameworks!
  inhibit_all_warnings!
  
# RxSwift
  pod 'RxSwift', '6.5.0'                   # https://github.com/ReactiveX/RxSwift
  pod 'RxCocoa', '6.5.0'
  pod 'NSObject+Rx', '5.2.2'               # https://github.com/RxSwiftCommunity/NSObject-Rx
  pod 'RxDataSources', '5.0.0'             # https://github.com/RxSwiftCommunity/RxDataSources
  pod 'RxSwiftExt', '6.2.1'               # https://github.com/RxSwiftCommunity/RxSwiftExt
  pod 'RxGesture','4.0.4'               # https://github.com/RxSwiftCommunity/RxGesture
  pod 'RxAlertController', '6.0.1'         # https://github.com/evgeny-sureev/RxAlertController
  pod 'RxTheme', '~> 6.0'  # https://github.com/RxSwiftCommunity/RxTheme
  
  # Networking
  pod 'Alamofire', '~> 5.10.0'        # https://github.com/Alamofire/Alamofire
  pod 'Moya/RxSwift', '15.0'      # https://github.com/Moya/Moya
  pod 'MoyaSugar/RxSwift', '1.3.3'                  # https://github.com/devxoul/MoyaSugar
  pod 'ReachabilitySwift', '5.2.4' # https://github.com/ashleymills/Reachability.swift
  
  
 # JSON数据模型
  pod 'Moya-ObjectMapper/RxSwift', :git => 'https://github.com/p-rob/Moya-ObjectMapper.git', :branch => 'master'  # https://github.com/ivanbruel/Moya-ObjectMapper

  
  # UI
  pod 'SnapKit', '5.7.1'                    # https://github.com/SnapKit/SnapKit
  pod 'Kingfisher', '8.5.0'                 # https://github.com/onevcat/Kingfisher
  pod 'DZNEmptyDataSet', '~> 1.8.1'          # https://github.com/dzenbot/DZNEmptyDataSet
  pod 'KafkaRefresh', '~> 1.7.0'             # https://github.com/OpenFeyn/KafkaRefresh
  pod 'IQKeyboardManagerSwift', '6.5.16'     # https://github.com/hackiftekhar/IQKeyboardManager
  pod 'Toast-Swift','~>5.1.1'                            # https://github.com/scalessec/Toast-Swift
 pod 'Hero', '~> 1.6.4'                     # https://github.com/lkzhao/Hero
  pod 'FSPagerView', '~> 0.8.3'              # https://github.com/WenchaoD/FSPagerView
  pod 'NVActivityIndicatorView', '~>5.2.0'   # https://github.com/ninjaprox/NVActivityIndicatorView

  # 日志
  pod 'CocoaLumberjack/Swift', '3.8.5'      # https://github.com/CocoaLumberjack/CocoaLumberjack
  
  
  # Date
  pod 'DateToolsSwift', '5.0.0'        # https://github.com/MatthewYork/DateTools
  pod 'SwiftDate', '~> 7.0'  # https://github.com/malcommac/SwiftDate

  # Code Quality
  pod 'Then', '3.0.0'                                 # https://github.com/devxoul/Then
  pod 'SwifterSwift', '~> 5.0'               # https://github.com/SwifterSwift/SwifterSwift
  pod 'R.swift', '5.0.3'                  # https://github.com/mac-cain13/R.swift
  pod 'DeviceKit', '~> 5.2'                  # https://github.com/devicekit/DeviceKit

  # Social
  pod 'MonkeyKing', '2.2.1'              # https://github.com/nixzhu/MonkeyKing
  
end

target 'SwiftyFrameworkTests' do
 # pod 'Quick', '7.6.2'  # https://github.com/Quick/Quick
 # pod 'Nimble', '13.7.1'  # https://github.com/Quick/Nimble
 # pod 'RxAtomic', :modular_headers => true
 # pod 'RxBlocking', '6.9.0'  # https://github.com/ReactiveX/RxSwift
 # pod 'RxTest', '6.9.0'
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

