//
//  Application.swift
//  Grocery
//
//  Created by BANYAN on 2020/4/13.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import IQKeyboardManagerSwift
import Reachability
import KafkaRefresh
import Kingfisher

class Application: NSObject {

    static let `default` = Application()
    
    // MARK: - Properties
    
    var reachability: Reachability?
    
    
    // MARK: - Public Methods
    
    func configutation() {
        reachability = Reachability()
        try? reachability?.startNotifier()
        
        setupKeyboardManager()
        
        setupKafkaRefresh()
        
        setupCocoaLumberjack()
        
        setupKingfisher()
    }
    
    // MARK: - Private Methods
    
    /// 配置`KafkaRefresh `
    private func setupKafkaRefresh() {
        if let defaults = KafkaRefreshDefaults.standard() {
            defaults.headDefaultStyle = .native
            defaults.footDefaultStyle = .native
        }
    }
    
    /// 配置键盘
    private func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "完成"
    }
    
    /// 配置日志插件
    private func setupCocoaLumberjack() {
        CocoaLumberjackManager.shared.configuration()
    }
    
    /// 配置`Kingfisher`
    private func setupKingfisher() {
        // 最大图片缓存、默认无限制
        ImageCache.default.diskStorage.config.sizeLimit = UInt(500 * 1024 * 1024)   // 500MB
        
        // 图片缓存周期、默认一周
        ImageCache.default.diskStorage.config.expiration = .days(10)
        
        // 图片下载超时时间、默认15秒
        ImageDownloader.default.downloadTimeout = 10.0
    }
}

/// `Kingfisher`
extension Application {
    func removeKingfisherCache() -> Observable<Void> {
        return ImageCache.default.rx.clearCache()
    }
    
    func kingfisherCacheSize() -> Observable<Int> {
        return ImageCache.default.rx.retrieveCacheSize()
    }
}

/// `清除应用缓存`
extension Application {
    func clearDataPersistence() {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)

        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        if FileManager.default.fileExists(atPath: filePath.path) {
            try! FileManager.default.removeItem(atPath: filePath.path)
        }
    }
}
