//
//  UIView+Extension.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/8/24.
//  Copyright © 2020 BANYAN. All rights reserved.
//

extension UIView {
    
    func blur(style: UIBlurEffect.Style) {
        unBlur()
        
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        insertSubview(blurEffectView, at: 0)
        blurEffectView.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
    }
    
    func unBlur() {
        subviews.filter { (view) -> Bool in
            view as? UIVisualEffectView != nil
            }.forEach { (view) in
                view.removeFromSuperview()
        }
    }
    
}
