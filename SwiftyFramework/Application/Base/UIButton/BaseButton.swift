//
//  BaseButton.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/5/20.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseButton: UIButton {
    
    // MARK: - Properties
    
    public var buttonTitle: String? {
        didSet {
            setTitle(buttonTitle, for: .normal)
        }
    }
    
    public var buttonSelectedTitle: String? {
        didSet {
            setTitle(buttonSelectedTitle, for: .selected)
        }
    }
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        
        makeUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Public Methods    
    
    func makeUI() {}
    func makeConstraints() {}
    
}
