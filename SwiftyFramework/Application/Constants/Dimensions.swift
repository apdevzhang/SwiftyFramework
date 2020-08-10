struct Dimensions {
    /// 状态栏高度
    static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    
    /// 屏幕宽度
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    /// 屏幕高度
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    /// 底部状态栏高度
    static let bottomBarHeight: CGFloat = 49.0
    
    /// 导航栏高度
    static let navigationBarHeight: CGFloat = 44.0
    
    /// 状态栏 + 导航栏高度
    static let navigationBarPlusStatusBarHeight: CGFloat = navigationBarHeight + statusBarHeight
    
    /// 安全区域机型
    static let isIphoneX: Bool = screenHeight >= 812 ? true : false
    
    static let topAreaHeight: CGFloat = statusBarHeight + navigationBarHeight
    
    static let bottomAreaHeight: CGFloat = isIphoneX ? 34.0 : 0
    
    /// iPhone X状态栏比iPhone8多出的部分
    static let topDiffHeight = statusBarHeight-20
}


struct SystemInfo {
    static let infoDictionary = Bundle.main.infoDictionary
    
    static let displayName = infoDictionary?["CFBundleDisplayName"] as? String
    
    static let bundleIdentifier = Bundle.main.bundleIdentifier
    
    static let version = infoDictionary?["CFBundleShortVersionString"]  as? String
    
    static let build = infoDictionary?["CFBundleVersion"] as? String
    
    static let systemVersion = UIDevice.current.systemVersion
    
    static let identifierNumber = UIDevice.current.identifierForVendor?.uuidString
    
    static let systemName = UIDevice.current.systemName
    
    static let localizedModel = UIDevice.current.localizedModel
}


