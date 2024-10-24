//
//  UserManager.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import Foundation




class UserManager {
    static let shared = UserManager() // 单例模式，方便全局访问
    
    private let userDefaults = UserDefaults.standard
    private let isLoggedInKey = "isLoggedIn"
    private let usernameKey = "username" // 添加用户名的 key
    // 保存登录状态
    func saveLoginState() {
        userDefaults.set(true, forKey: isLoggedInKey)
    }
    
    // 清除登录状态
    func clearLoginState() {
        userDefaults.set(false, forKey: isLoggedInKey)
    }
    
    // 检查登录状态
    func isLoggedIn() -> Bool {
        return userDefaults.bool(forKey: isLoggedInKey)
    }
    // 获取当前登录用户的用户名
    func currentUsername() -> String? {
        return userDefaults.string(forKey: usernameKey)
    }
    // 退出登录
    func logout() {
        clearLoginState()
    }
}
