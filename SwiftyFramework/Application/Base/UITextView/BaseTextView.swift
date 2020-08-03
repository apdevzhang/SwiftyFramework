//
//  BaseTextView.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/5/20.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseTextView: TextViewMaster {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        makeUI()
        makeConstraints()
        bindViewModel()
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
    func bindViewModel() {}
    
}
