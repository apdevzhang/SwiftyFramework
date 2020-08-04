//
//  UserDefault.swift
//  SwiftyFramework
//
//  Created by BANYAN on 2020/3/11.
//  Copyright © 2020 BANYAN. All rights reserved.
//

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
