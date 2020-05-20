//
//  BaseCollectionReusableView.swift
//  Apollo
//
//  Created by BANYAN on 2020/5/15.
//  Copyright © 2020 Apollo. All rights reserved.
//

class BaseCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    var disposeBag = DisposeBag()
    
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    /// 启用光栅化
    func makeRasterize() {
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
