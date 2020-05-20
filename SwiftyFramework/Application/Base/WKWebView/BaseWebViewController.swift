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
        
        wkWebView.customUserAgent = UserAgent.shared.userAgentString()
        
        makeUI()
        
        webViewConfiguration()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UI
    
    func makeUI() {
        self.view.addSubview(wkWebView)
        
        wkWebView.snp.makeConstraints { (x) in
            x.edges.equalToSuperview()
        }
    }

    
    // MARK: - Public Methods
    
    // 加载进度管理（可根据项目需要设置加载动画）
    func webViewLoading(_ progress: Double) {
        DDLogInfo("webView加载进度：\(progress)%")
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
        
        // webView url
        wkWebView.rx.url
            .share(replay: 1)
            .subscribe(onNext: { [weak self] (url) in
                DDLogInfo("URL: \(String(describing: url))")
            }).disposed(by: rx.disposeBag)
        
        // 加载进度
        wkWebView.rx.estimatedProgress
            .share(replay: 1)
            .subscribe(onNext: { [weak self] (progress) in
                self?.webViewLoading(progress)
            }).disposed(by: rx.disposeBag)
        
        // 页面加载完毕时调用
        wkWebView.rx
            .didFinishNavigation
            .debug("didFinishNavigation")
            .subscribe(onNext: { _ in
                
            })
            .disposed(by: rx.disposeBag)
        
        wkWebView.rx.loading
            .share(replay: 1)
            .subscribe(onNext: { (loading) in
                DDLogInfo("loading: \(loading)")
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = loading
            }).disposed(by: rx.disposeBag)
    }
    
}


