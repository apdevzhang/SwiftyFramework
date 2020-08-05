
struct UserDefaultConfig {    
    /// 是否第一次登录
    @UserDefault(key: "vrigin", defaultValue: false)
    static var vrigin: Bool
    
    /// 登录成功标识
    @UserDefault(key: "success", defaultValue: false)
    static var success: Bool
}


@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    var value: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    var wrappedValue: T {
      get { value }
      set { value = newValue }
    }
}
