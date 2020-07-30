//
//  BaseImageView.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/5/20.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        #if DEBUG
            backgroundColor = .random
        #else

        #endif
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
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
