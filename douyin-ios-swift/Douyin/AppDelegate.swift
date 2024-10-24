//
//  AppDelegate.swift
//  Douyin
//
//  Created by Qiao Shi on 2018/8/1.
//  Copyright © 2018年 Qiao Shi. All rights reserved.
//

import Foundation
import CoreTelephony
import Photos
//id ：demo.douyin
//new ID:MIT.TestApp
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var tabIndex = 0
    var workAwemes = [Aweme]()
    var favoriteAwemes = [Aweme]()
    var pageIndex = 0;
    let pageSize = 21
   // let uid = 10
    let indexPath = 0
    let uid:String = "97795069353"
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
       // let controller = tabIndex == 0 ? AwemeListController.init(data: workAwemes, currentIndex: indexPath, page: pageIndex, size: pageSize, awemeType: .AwemeWork, uid: uid) : AwemeListController.init(data: favoriteAwemes, currentIndex: indexPath, page: pageIndex, size: pageSize, awemeType: .AwemeFavorite, uid: uid)
     
        
        
        /*
         后加
        window = UIWindow(frame: UIScreen.main.bounds)
       // window?.rootViewController = UINavigationController.init(rootViewController: AwemeListController.init(data: workAwemes, currentIndex: indexPath, page: pageIndex, size: pageSize, awemeType: .AwemeWork, uid: uid))
        window?.rootViewController = UINavigationController.init(rootViewController:controller)
        */
        // 请求权限
            requestPermission()
        
        if UserManager.shared.isLoggedIn() {
                // 如果已登录，将根视图控制器设置为 MyTabBarController
                let tabBarCtr = MyTabBarController()
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = tabBarCtr
                window?.makeKeyAndVisible()
            } else {
                // 如果未登录，将根视图控制器设置为 LoginViewController
                let loginViewController = LoginViewController()
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = loginViewController
                window?.makeKeyAndVisible()
            }
        
        
//        let tabBarCtr = MyTabBarController()
//        //MARK:最初是代码
//        window = UIWindow(frame: UIScreen.main.bounds)
////        window?.rootViewController = UINavigationController.init(rootViewController:AwemeListController.init())
//        window?.rootViewController = tabBarCtr  // 将 tabBarCtr 设置为根视图控制器
        
        window?.makeKeyAndVisible()
        
        AVPlayerManager.setAudioMode()
        NetworkManager.startMonitoring()
        WebSocketManger.shared().connect()
        requestPermission()

        VisitorRequest.saveOrFindVisitor(success: { data in
            let response = data as! VisitorResponse
            let visitor = response.data
            Visitor.write(visitor:visitor!)
        }, failure: { error in
            print("注册访客用户失败")
        })

        return true
    }
    
    func requestPermission() {
        PHPhotoLibrary.requestAuthorization { (PHAuthorizationStatus) in
            //process photo library request status.处理照片库请求状态
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touchLocation = (event?.allTouches)?.first?.location(in: self.window)
        let statusBarFrame = UIApplication.shared.statusBarFrame
        if statusBarFrame.contains(touchLocation!) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: StatusBarTouchBeginNotification), object: nil)
        }
    }
    func isLoggedIn() -> Bool {
        // 这里你需要实现检查用户登录状态的逻辑
        // 可以通过检查本地存储、缓存或者其他方式来确定用户是否已登录
        // 返回 true 表示已登录，返回 false 表示未登录
        return false // 这里先假设未登录
    }
}

