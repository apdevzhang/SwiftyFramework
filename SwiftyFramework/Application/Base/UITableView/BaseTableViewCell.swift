//
//  BaseTableViewCell.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/5.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: - Properties
    var cellDisposeBag = DisposeBag()
    
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cellDisposeBag = DisposeBag()
    }    
    
}
