//
//  ColorConst.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/10.
//  Copyright © 2020 BANYAN. All rights reserved.
//

extension UIColor {
    
    // MARK: - System
    static let primaryColor = dynamicColor(hexLight: "FFFFFF", hexDark: "CC00FF", transparency: 0.7)
    
    // MARK: -
    

    
    
    // MARK - 颜色适配
     static func dynamicColor(hexLight: String, hexDark: String, transparency: CGFloat) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { (trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return UIColor(hexString: hexDark, transparency: transparency)!
                } else {
                    return UIColor(hexString: hexLight, transparency: transparency)!
                }
            }
        } else {
            return UIColor(hexString: hexLight, transparency: transparency)!
        }
    }
}
