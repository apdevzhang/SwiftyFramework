//
//  BaseCollectionViewCell.swift
//  GiTiny
//
//  Created by DongHeeKang on 22/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var cellDisposeBag = DisposeBag()
    
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellDisposeBag = DisposeBag()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Public Methods
    
    func makeUI() {}
    func makeConstraints() {}
    
    /// 启用光栅化
    func makeRasterize() {
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
}
