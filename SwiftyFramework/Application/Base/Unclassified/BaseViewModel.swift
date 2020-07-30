//
//  ViewModelType.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class BaseViewModel: NSObject {
    
    // MARK: - Properties
    
    let loading = ActivityIndicator()
    let headerLoading = ActivityIndicator()
    let footerLoading = ActivityIndicator()
    
    let errorTracker = ErrorTracker()
    
    let errorResponse = PublishSubject<ErrorResponse>()
    
    /// 初始化分页
    var currentPage = 1
    
    /// 分页总数
    var totalPage = 1
    
    /// 单次分页条数
    var pageSize = 10
    
    /// 用于判断是否到达最后一页
    let lastPageSubject = PublishSubject<Bool>()
    
    
    // MARK: - Lifecycle
    
    deinit {
        DDLogInfo("\(self.className)已释放")
    }
    
    override init() {
        super.init()
        
        errorTracker.asDriver()
            .drive(onNext: { [weak self] (error) in
                guard let self = self else { return }
                
                do {
                    let errorResponse = error as? MoyaError
                    
                    if let body = try errorResponse?.response?.mapJSON() as? [String: Any], let errorResponse = Mapper<ErrorResponse>().map(JSON: body) {
                        self.errorResponse.onNext(errorResponse)
                    }
                } catch {
                    DDLogError("\(error.localizedDescription)")
                }
                
            }).disposed(by: rx.disposeBag)
        
        errorResponse.subscribe(onNext: { (errorResponse) in
            DDLogInfo("\(errorResponse.message)")
        }).disposed(by: rx.disposeBag)
    }
    
}

