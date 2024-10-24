//
//  FourViewController.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class FourViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    var isHeadViewRed = false
    
    
    
    @IBOutlet weak var tableView: UITableView!
    let menuItems = ["地图", "设置", "反馈", "关于", "退出"]
    let usernamePrefix = "用户名: "
    override func viewDidLoad() {
        super.viewDidLoad()
        if let username = UserManager.shared.currentUsername() {
            userName.text = "\(usernamePrefix)\(username)"
        } else {
            userName.text = "\(usernamePrefix)未登录"
        }
        //        tableView.register(UINib(nibName: "YourCustomCell", bundle: nil), forCellReuseIdentifier: "individualCenter")
        // 注册默认单元格类
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "individualCenter")
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //        userName.text = UserManager.shared.currentUsername()
        
//        let logoutButton = UIButton.init(frame: CGRect(x: 100, y:view.frame.height - 50, width: 90, height: 90))
//        logoutButton.setTitle("退出登录", for: .normal)
//        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
//        view.addSubview(logoutButton)
    }
//    @objc func logoutButtonTapped(){
//        UserManager.shared.logout()
//        // 回到登录页面
//        let loginVC = LoginViewController()
//        let navController = UINavigationController(rootViewController: loginVC)
//        navController.modalPresentationStyle = .fullScreen
//        present(navController, animated: true, completion: nil)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "individualCenter", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = menuItems[indexPath.row]
        switch selectedItem {
        case "地图":
            // 执行地图相关操作
            let mapVC = MapViewController()
            navigationController?.pushViewController(mapVC, animated: true)
            break
        case "设置":
            // 执行设置相关操作
            changeHeadViewBackgroundColor()
            break
        case "反馈":
            // 执行反馈相关操作
            //                performSegue(withIdentifier: "FeedbackViewController", sender: nil)
            let aboutVC = FeedbackViewController(nibName: "FeedbackViewController", bundle: nil)
            navigationController?.pushViewController(aboutVC, animated: true)
            break
        case "关于":
            // 执行关于相关操作
            //                performSegue(withIdentifier: "AboutViewController", sender: nil)
            let aboutVC = AboutViewController(nibName: "AboutViewController", bundle: nil)
            navigationController?.pushViewController(aboutVC, animated: true)
            break
        case "退出":
            // 执行退出相关操作
            UserManager.shared.logout()
            // 回到登录页面
            let loginVC = LoginViewController()
            let navController = UINavigationController(rootViewController: loginVC)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
            break
        default:
            break
        }
        
        // 取消选中状态
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func changeHeadViewBackgroundColor() {
            // 更改 headView 的背景颜色
//            headView.backgroundColor = UIColor.red // 你可以设置为你想要的任何颜色
        if isHeadViewRed {
                    headView.backgroundColor = UIColor.lightGray // 原来的颜色
                } else {
                    headView.backgroundColor = UIColor.purple
                }
                isHeadViewRed.toggle() // 切换状态
        }
}
