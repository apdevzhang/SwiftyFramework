//
//  BaseView.swift
//  Apollo
//
//  Created by BANYAN on 2020/5/6.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseView: UIView {
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isOpaque = true
        
        makeUI()
        makeConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Public Methods
    
    func makeUI() {}
    func makeConstraints() {}
    
}
