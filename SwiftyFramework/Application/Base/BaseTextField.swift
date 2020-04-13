//
//  BaseTextField.swift
//  Grocery
//
//  Created by BANYAN on 2020/4/13.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // iOS 12 自动填充验证码
        if #available(iOS 12.0, *) {
            self.textContentType = .oneTimeCode
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    
    
    // MARK: - Setter
    
    
    // MARK: - Getter
    
    
}
