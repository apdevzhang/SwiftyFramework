//
//  BaseTableViewHeaderFooterView.swift
//  Apollo
//
//  Created by BANYAN on 2020/5/12.
//  Copyright © 2020 Apollo. All rights reserved.
//

class BaseTableViewHeaderFooterView: UITableViewHeaderFooterView {

     // MARK: - Properties
    
     var disposeBag = DisposeBag()
    
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
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
    
    /// 启用光栅化
    func makeRasterize() {
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
}
