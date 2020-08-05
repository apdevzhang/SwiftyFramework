//
//  BaseViewController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import DZNEmptyDataSet

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    /// 导航栏标题
    var navigationTitle = "" {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
        
    // Refresh properities
    let isLoading = BehaviorRelay(value: false)
    let headerRefreshTrigger = PublishSubject<Void>()
    let footerRefreshTrigger = PublishSubject<Void>()
    let isHeaderLoading = BehaviorRelay(value: false)
    let isFooterLoading = BehaviorRelay(value: false)
    
    // EmptyDataSet properties    
    var emptyDataSetTitle = NSAttributedString(string: "")
    var emptyDataSetDescription = NSAttributedString(string: "")
    var emptyDataSetImage = UIImage(named: "")
    var emptyDataSetImageTintColor: UIColor?
    let emptyDataSetViewTap = PublishSubject<Void>()
    
    
    // MARK: - Lifecycle
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        DDLogInfo("退出页面：\(self.className)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                updateColorAppearance()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DDLogInfo("进入页面: \(self.className)")
        
        view.backgroundColor = .white
        
        hero.isEnabled = true
    
        /**
         这边设想的是断网情况不仅仅出现在由`tableView`或是`collectionView`组成的基础页面上，
         而UI断网提示页面可能会出现在各种不同的页面之上，
         更好的业务处理是在有网情况下使用`EmptyDataSet`，断网的情况下使用自定义UI填充页面，待
         网络重新连上的时候`remove`掉更好
         */
        ReachabilityManager.shared.reach
            .subscribe(onNext: { [weak self] (boolValue) in
                guard let self = self else { return }
                
                boolValue == true ? self.emptyDataSetNetworkOnline() : self.emptyDataSetOffNetwork()
            }).disposed(by: rx.disposeBag)
        
        
        makeUI()
        makeConstraints()
        bindViewModel()
    }
    
    
    // MARK: - Public Methods
    
    func makeUI() {}
    func makeConstraints() {}
    func bindViewModel() {}
    
    func emptyDataSetOffNetwork() {}
    func emptyDataSetNetworkOnline() {}
    
    ///更新暗黑模式
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
    
}

extension BaseViewController: DZNEmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return emptyDataSetTitle
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return emptyDataSetDescription
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return emptyDataSetImage
    }
    
    func imageTintColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return emptyDataSetImageTintColor
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

