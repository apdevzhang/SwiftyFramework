

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
        
        #if DEBUG
            DDLogInfo("debug~~~~~")
        #elseif PRODUCT
            DDLogInfo("product~~~~")
        #else
            DDLogInfo("release~~~")
        #endif
        
        // 真机测试
        Reachability.rx.status
            .subscribe(onNext: { (status: Reachability.Connection) in
                DDLogInfo("网络状态: \(status)")
              })
            .disposed(by: rx.disposeBag)
    }
    
    override func emptyDataSetOffNetwork() {
        emptyDataSetTitle = NSAttributedString(string: "断网空白页")
    }
    
    override func emptyDataSetNetworkOnline() {
        emptyDataSetTitle = NSAttributedString(string: "有网无数据")
    }
    
}

