//
//  DeviceUtils.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit
//DeviceUtils.getSearchBarYPosition()
class DeviceUtils {
    static func getSearchBarYPosition() -> CGFloat {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let navigationBarHeight: CGFloat = 44 // 或者根据实际导航栏高度来获取
        
        var searchBarY: CGFloat = 0
        
        if statusBarHeight > 20 {
            // 是刘海屏设备，状态栏高度为 44 点
            searchBarY = statusBarHeight + navigationBarHeight
        } else {
            // 非刘海屏设备，状态栏高度为 20 点
            searchBarY = statusBarHeight + navigationBarHeight
        }
        
        return searchBarY
    }
}



