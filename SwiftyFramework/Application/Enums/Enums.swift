
/// 全屏状态
enum ScreenOrientation {
    case unknow, landscape, portrait
}


/// 性别
enum Gender: Int, Codable {
    case male, female, secret
    
    var stringValue: String {
        switch self {
        case .male:
            return "男"
        case .female:
            return "女"
        case .secret:
            return "保密"
        }
    }
    
    var intValue: Int {
        switch self {
        case .male:
            return 0
        case .female:
            return 1
        case .secret:
            return 2
        }
    }
}
