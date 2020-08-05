
/// 全屏状态
enum ScreenOrientation {
    case unknow, landscape, portrait
}


/// 性别
enum Gender: Int, Codable {
    case male, female, unkonw
    
    func description() -> String {
        switch self {
        case .male:
            return "男"
        case .female:
            return "女"
        case .unkonw:
            return "未知"
        }
    }
}
