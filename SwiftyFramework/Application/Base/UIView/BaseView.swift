//
//  BaseView.swift
//  Apollo
//
//  Created by BANYAN on 2020/5/6.
//  Copyright © 2020 BANYAN. All rights reserved.
//


class BaseView: UIView {

    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = true
        
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
