//
//  ViewController.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/5/20.
//  Copyright © 2020 BANYAN. All rights reserved.
//

class ViewController: BaseViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ServiceErrorManager.shared.errorResponse
            .subscribe(onNext: { (response) in
                DDLogInfo("\(response.message)")
            }).disposed(by: rx.disposeBag)
    }
    
    override func emptyDataSetOffNetwork() {
        emptyDataSetTitle = NSAttributedString(string: "断网空白页")
    }
    
    override func emptyDataSetNetworkOnline() {
        emptyDataSetTitle = NSAttributedString(string: "有网无数据")
    }
    
}
