//
//  BaseWebViewController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/19.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import RxSwift
import RxCocoa
import RxWebKit
import WebKit

class BaseWebViewController: BaseViewController {
    
    // MARK: - Properties
    
    let wkWebView = WKWebView()
    
    let url = BehaviorRelay<URL?>(value: nil)
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webViewConfiguration()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UI
    
    override func makeUI() {
        view.addSubview(wkWebView)
        
        wkWebView.snp.makeConstraints { (x) in
            x.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Private Methods
    
    private func webViewConfiguration() {
        // 加载URL
        url.subscribe(onNext: { [weak self] (url) in
            if let url = url {
                let request = URLRequest(url: url)
                
                self?.wkWebView.load(request)
            }
        }).disposed(by: rx.disposeBag)
        
        // 如果已经设定独有的标题则不再使用webView的标题
        wkWebView.rx.title
            .share(replay: 1)
            .subscribe(onNext: { [weak self] (title) in
                self?.navigationTitle = self?.navigationTitle ?? title!
            }).disposed(by: rx.disposeBag)

        // 加载进度
        wkWebView.rx.estimatedProgress
            .share(replay: 1)
            .subscribe(onNext: { (progress) in
                // 加载进度管理（可根据项目需要设置加载动画）
            }).disposed(by: rx.disposeBag)
        
        wkWebView.rx.loading
            .share(replay: 1)
            .subscribe(onNext: { (loading) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = loading
            }).disposed(by: rx.disposeBag)
    }
    
}
