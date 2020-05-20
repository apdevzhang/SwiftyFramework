//
//  BaseTextField.swift
//  Grocery
//
//  Created by BANYAN on 2020/4/13.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseTextField: UITextField {
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // iOS 12 自动填充验证码
        if #available(iOS 12.0, *) {
            self.textContentType = .oneTimeCode
        }
        self.autocapitalizationType = .none
        
        makeUI()
        makeConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func makeUI() {}
    func makeConstraints() {}
    
}
