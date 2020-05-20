//
//  BaseCollectionViewController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/3.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class BaseCollectionViewController: BaseViewController {
    
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
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (x) in
            x.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Public Methods
    
    func bindViewModel() {
        // emptyDataSet
        let updateEmptyDataSet = Observable.of(isLoading.mapToVoid().asObservable(), emptyDataSetImageTintColor.mapToVoid()).merge()
        updateEmptyDataSet.subscribe(onNext: { [weak self] () in
            self?.collectionView.reloadEmptyDataSet()
        }).disposed(by: rx.disposeBag)
        
        disableRefreshTrigger.subscribe(onNext: { [weak self] (bool) in
            if bool {
                self?.collectionView.headRefreshControl = nil
                self?.collectionView.footRefreshControl = nil
            }
        }).disposed(by: rx.disposeBag)
        
        // 处理空白页点击事件（重新触发下拉刷新）
        emptyDataSetViewTap.subscribe(onNext: { [weak self] _ in
            self?.headerRefreshTrigger.onNext(())
        }).disposed(by: rx.disposeBag)
        
        // 处理分页到底部的情况
        isLastPageTrigger.subscribe(onNext: { [weak self] (bool) in
            if bool {
                self?.collectionView.footRefreshControl.endRefreshingAndNoLongerRefreshing(withAlertText: "")
            } else {
                self?.collectionView.footRefreshControl.resumeRefreshAvailable()
            }
        }).disposed(by: rx.disposeBag)
    }
    
    func headerRefresh() -> Observable<Void> {
        let refresh = Observable.of(Observable.just(()), headerRefreshTrigger).merge()
        
        return refresh
    }
    
    
    // MARK: - Private Methods
    
    private func bindRefresh() {
        collectionView.bindGlobalStyle(forHeadRefreshHandler: { [weak self] in
            self?.headerRefreshTrigger.onNext(())
        })
        
        collectionView.bindGlobalStyle(forFootRefreshHandler: { [weak self] in
            self?.footerRefreshTrigger.onNext(())
        })
        
        isHeaderLoading.bind(to: collectionView.headRefreshControl.rx.isAnimating).disposed(by: rx.disposeBag)
        isFooterLoading.bind(to: collectionView.footRefreshControl.rx.isAnimating).disposed(by: rx.disposeBag)
        
        collectionView.footRefreshControl.autoRefreshOnFoot = true
    }
    
    
    // MARK: - Getter
    
    lazy var collectionView: UICollectionView = {
        let x = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        x.backgroundColor = .white
        x.alwaysBounceVertical = true
//        x.alwaysBounceHorizontal = true
        x.emptyDataSetSource = self
        x.emptyDataSetDelegate = self
        
        return x
    }()
    
    lazy var flowLayout = UICollectionViewFlowLayout().then { (x) in
        x.scrollDirection = .vertical
        x.itemSize = CGSize(width: 0, height: 0)
        x.minimumLineSpacing = 0
        x.minimumInteritemSpacing = 0
        x.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension BaseCollectionViewController {
    func deselectSelectedItems() {
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            selectedIndexPaths.forEach({ (indexPath) in
                collectionView.deselectItem(at: indexPath, animated: false)
            })
        }
    }
}
