//
//  BaseTableViewController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/17.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import DZNEmptyDataSet
import KafkaRefresh

class BaseTableViewController: BaseViewController {
    
    // MARK: - Properties
        
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        bindRefresh()
        
        bindViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UI
    
    func makeUI() {
        view.addSubview(tableView)
  
        tableView.snp.makeConstraints { (x) in
            x.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Public Methods
    
    func bindViewModel() {
        // emptyDataSet
        let updateEmptyDataSet = Observable.of(isLoading.mapToVoid().asObservable(), emptyDataSetImageTintColor.mapToVoid()).merge()
        updateEmptyDataSet.subscribe(onNext: { [weak self] () in
            self?.tableView.reloadEmptyDataSet()
        }).disposed(by: rx.disposeBag)
        
        // 禁用刷新控件（在数据固定的页面使用）
        disableRefreshTrigger.subscribe(onNext: { [weak self] (bool) in
            if bool {
                self?.tableView.headRefreshControl = nil
                self?.tableView.footRefreshControl = nil
            }
        }).disposed(by: rx.disposeBag)
        
        // 处理空白页点击事件（重新触发下拉刷新）
        emptyDataSetViewTap.subscribe(onNext: { [weak self] _ in
            self?.headerRefreshTrigger.onNext(())
        }).disposed(by: rx.disposeBag)
        
        // 处理分页到底部的情况
        isLastPageTrigger.subscribe(onNext: { [weak self] (bool) in
            if bool {
                self?.tableView.footRefreshControl.endRefreshingAndNoLongerRefreshing(withAlertText: "")
            } else {
                self?.tableView.footRefreshControl.resumeRefreshAvailable()
            }
        }).disposed(by: rx.disposeBag)
    }
    
    func headerRefresh() -> Observable<Void> {
        let refresh = Observable.of(Observable.just(()), headerRefreshTrigger).merge()
        
        return refresh
    }
    
    
    // MARK: - Private Methods
    
    private func bindRefresh() {
        tableView.bindGlobalStyle(forHeadRefreshHandler: { [weak self] in
            self?.headerRefreshTrigger.onNext(())
        })
        
        tableView.bindGlobalStyle(forFootRefreshHandler: { [weak self] in
            self?.footerRefreshTrigger.onNext(())
        })
        
        isHeaderLoading.bind(to: tableView.headRefreshControl.rx.isAnimating).disposed(by: rx.disposeBag)
        isFooterLoading.bind(to: tableView.footRefreshControl.rx.isAnimating).disposed(by: rx.disposeBag)
        
        tableView.footRefreshControl.autoRefreshOnFoot = true
    }
    

    // MARK: - Getter
    
    lazy var tableView: BaseTableView = {
        let x = BaseTableView(frame: self.view.bounds, style: .plain)
        x.backgroundColor = .white
        x.emptyDataSetDelegate = self
        x.emptyDataSetSource = self
        return x
    }()
    
}

extension BaseTableViewController {
    func deselectSelectedRow() {
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            selectedIndexPaths.forEach { (indexPath) in
                tableView.deselectRow(at: indexPath, animated: false)
            }
        }
    }
}





