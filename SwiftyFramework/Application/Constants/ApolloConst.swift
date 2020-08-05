/// 默认事件响应间隔  一秒一次 `View` `Button` `Label`...
let DefaultEventResponderTimeInterval: DispatchTimeInterval = DispatchTimeInterval.seconds(1)

/// 全局banner滚动间隔速度
let ApolloBannerSlidingInterval: CGFloat = 3.0

///main AppDelegate
let MainDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

///rootViewController
let MainController: UIViewController? = MainDelegate.window?.rootViewController

let DefaultEmptyDataSetTitle = "该页面暂无信息~"

/// 尺寸16:9
let Divide16By9: CGFloat = 0.5625

/// 尺寸4:3
let Divide4By3: CGFloat = 0.75

/// 尺寸2:1
let Divide2By1: CGFloat = 0.5
