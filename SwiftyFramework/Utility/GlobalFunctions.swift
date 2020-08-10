//
//  GlobalFunctions.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import Toast_Swift
import RxSwift
import Moya


// MARK: - 全局通用提示样式
func MakeToast(message: String) {
    var toastStyle = ToastStyle()
    toastStyle.messageColor = .white
    toastStyle.messageFont = .systemFont(ofSize: 16)
    UIApplication.shared.keyWindow?.makeToast(message, duration: 2, position: .center, style: toastStyle)
}


// MARK: - 延迟在主线程运行
func delayToMainThread(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter (
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}


/**
 `Swift`的`Int`是和CPU架构有关的：
 在32位的CPU上（也就是iPhone5和前任门），实际上它是`Int32`
 而在64位的CPU（iPhone5s及以后的机型）上是`Int64`
 `arc4random`所返回的值不论在什么平台上都是一个`UInt32`，于是在32位的平台上就有一半几率在进行`Int`转换时越界,
 时不时的崩溃也就不足为奇了
 */

// MARK: - 随机数
func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return Int(arc4random_uniform(count)) + range.startIndex
}
