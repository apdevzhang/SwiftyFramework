//
//  BaseViewController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    /// 导航栏标题
    var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    // refresh properities
    let isLoading = BehaviorRelay(value: false)
    let headerRefreshTrigger = PublishSubject<Void>()
    let footerRefreshTrigger = PublishSubject<Void>()
    let isHeaderLoading = BehaviorRelay(value: false)
    let isFooterLoading = BehaviorRelay(value: false)
    /// 是否禁用刷新（用于不需要刷新的页面）
    let disableRefreshTrigger = PublishSubject<Bool>()
    
    // 统一在BaseTableView和BaseCollectionView处理分页请求最后一页情况
    // 如果需要在不同页面单独处理底部文案或其他情况，那么在需要的页面不将ViewModel的`lastPageSubject`绑定基类的`isLastPageTrigger`
    // 然后在需要的页面单独处理即可
    let isLastPageTrigger = PublishSubject<Bool>()
    
    
    // emptyDataSet properties
    var emptyDataSetTitle = ""
    var emptyDataSetDescription = ""
    var emptyDataSetImage = UIImage(named: "")
    var emptyDataSetImageTintColor = BehaviorRelay<UIColor?>(value: nil)
    let emptyDataSetViewTap = PublishSubject<Void>()
    
    
    // MARK: - Lifecycle
    deinit {
        NotificationCenter.default.removeObserver(self)
        DDLogInfo("退出页面：\(self.className)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateColorAppearance()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        DDLogInfo("进入页面: \(self.className)")
        
        view.backgroundColor = .white
        
        hero.isEnabled = true
        
        automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
                
        networkListener()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // 暗夜模式监听
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                updateColorAppearance()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Public Methods
    // MARK: 更新暗黑模式
    func updateColorAppearance() {
        if #available(iOS 13.0, *) {
            if let state = AppearanceState(rawValue: AppearanceDefault.appearanceState) {
                switch state {
                case .dark:
                    overrideUserInterfaceStyle = .dark
                    self.navigationController?.overrideUserInterfaceStyle = .dark
                case .light:
                    overrideUserInterfaceStyle = .light
                    self.navigationController?.overrideUserInterfaceStyle = .light
                case .system:
                    overrideUserInterfaceStyle = .unspecified
                    self.navigationController?.overrideUserInterfaceStyle = .unspecified
                }
            }
        }
    }
    
    
    // MARK: - Private Methods
    // 网络状态监听
    func networkListener() {
        // 隐藏断网toast
        Reachability.rx.isConnected
            .subscribe(onNext: {
                DDLogInfo("Is connected")
            }).disposed(by: rx.disposeBag)
        
        // 显示断网toast
        Reachability.rx.isDisconnected
            .subscribe(onNext: {
                DDLogInfo("Is disconnected")
            }).disposed(by: rx.disposeBag)
    }
    

    // MARK: - Delegate
    
    
    // MARK: - Setter
    
    
    // MARK: - Getter
}

extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let count = self.navigationController?.viewControllers.count else { return false }
        
        return count > 1 ? true : false
    }
}

extension BaseViewController: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: emptyDataSetTitle)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: emptyDataSetDescription)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return emptyDataSetImage
    }
    
    func imageTintColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return emptyDataSetImageTintColor.value
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return .clear
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -60
    }
}

extension BaseViewController: DZNEmptyDataSetDelegate {
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return !isLoading.value
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        emptyDataSetViewTap.onNext(())
    }
}