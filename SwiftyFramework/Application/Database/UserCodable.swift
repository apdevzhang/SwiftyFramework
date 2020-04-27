//
//  DataPersistenceManager.swift
//  Grocery
//
//  Created by BANYAN on 2020/4/26.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit

enum Gender: Int, Codable {
    case male, female, unkonw
    
    func description() -> String {
        switch self {
        case .male:
            return "男"
        case .female:
            return "女"
        case .unkonw:
            return "未知"
        }
    }
}

struct UserData: Codable {
    var name: String?    
    var gender: Gender?
}

class UserDataManager {
    
    private init(){}
    
    static let shared = UserDataManager()
    
    static let kPathname = "UserData.plist"
    
    // MARK: - Properties
    
    var user: UserData! {
        set {
            encodeUserData(userData: newValue)
        }
        get {
            return try! decodeUserData()
        }
    }
    
    // MARK: - Public Methods
    
    /// decode
    public func decodeUserData() throws -> UserData? {
        let path = userDataFilePath()
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path.path) as? Data else {
            return UserData()
        }
        do {
            let result = try PropertyListDecoder().decode(UserData.self, from: data)
            return result
        } catch {
            throw error
        }
    }
    
    /// encode
    public func encodeUserData(userData: UserData) {
        do {
            let data = try PropertyListEncoder().encode(userData)
            NSKeyedArchiver.archiveRootObject(data, toFile: userDataFilePath().path)
        } catch {
            DDLogError("\(error.localizedDescription)")
        }
    }
    
    public func removeUserData() {
        let dataPath = userDataFilePath().path
        if FileManager.default.fileExists(atPath: dataPath) {
            try! FileManager.default.removeItem(atPath: dataPath)
        }
    }
    
    // MARK: - Private Methods
    private func userDataFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent(UserDataManager.kPathname)
    }
        
}
