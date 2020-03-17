// https://github.com/dougdiego/DarkModeDemo

import Foundation

struct AppearanceDefault {
    @UserDefault(key: "appearance_state", defaultValue: 0)
    static var appearanceState: Int
}

enum AppearanceState: Int {
    
    case system = 0, light, dark
        
    static let count: Int = {
        var max: Int = 0
        while AppearanceState(rawValue: max) != nil { max += 1 }
        return max
    }()
    
    func name() -> String {
        switch self {
        case .system:
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"            
        }
    }
    
}


