//
//  BaseTableViewCell.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/5.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell {

    // MARK: - Properties
    var cellDisposeBag = DisposeBag()
    
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellDisposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        makeUI()
        makeConstraints()
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
