import UIKit
import Toast_Swift
import RxSwift
import Moya


// MARK: - 全局通用提示样式
func MakeToast(message: String) {
    var toastStyle = ToastStyle()
    toastStyle.messageColor = .black
    toastStyle.messageFont = UIFont.systemFont(ofSize: 18)
    UIApplication.shared.keyWindow?.makeToast(message, duration: 2, position: .center, style: toastStyle)
}


// MARK: - 延迟在主线程运行
func delayToMainThread(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter (
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
