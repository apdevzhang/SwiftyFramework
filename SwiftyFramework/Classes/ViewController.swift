

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
    }
    
    override func emptyDataSetOffNetwork() {
        emptyDataSetTitle = NSAttributedString(string: "断网空白页")
    }
    
    override func emptyDataSetNetworkOnline() {
        emptyDataSetTitle = NSAttributedString(string: "有网无数据")
    }
    
}

