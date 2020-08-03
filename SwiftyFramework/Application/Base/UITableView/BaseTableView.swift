//
//  BaseTableView.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseTableView: UITableView {

    // MARK: - Lifecycle
    
    init() {
        super.init(frame: CGRect(), style: .grouped)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        makeUI()
    }
    
    override func reloadData() {
        super.reloadData()
        
        if visibleCells.isEmpty { return }
    }

    
    // MARK: - Public Methods
    
    func makeUI() {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 100
        estimatedSectionFooterHeight = 0
        estimatedSectionHeaderHeight = 0
        backgroundColor = .white
        cellLayoutMarginsFollowReadableWidth = false
        keyboardDismissMode = .onDrag
        separatorColor = .clear
//        if #available(iOS 11.0, *) {
//            contentInsetAdjustmentBehavior = .never
//        }
        tableHeaderView = UIView()
        tableFooterView = UIView()
    }
        
}
