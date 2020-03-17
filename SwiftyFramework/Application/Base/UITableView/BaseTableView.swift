//
//  BaseTableView.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit

class BaseTableView: UITableView {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: CGRect(), style: .grouped)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        initUI()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initUI()
    }

    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    func initUI() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 100
        sectionHeaderHeight = 40
        backgroundColor = .white
        cellLayoutMarginsFollowReadableWidth = false
        keyboardDismissMode = .onDrag
        separatorColor = .clear
        tableHeaderView = UIView()
        tableFooterView = UIView()
    }
    
    override func reloadData() {
        super.reloadData()
        
        if visibleCells.isEmpty { return }
    }
    
    // MARK: - Setter
    
    
    // MARK: - Getter
    
    
}
