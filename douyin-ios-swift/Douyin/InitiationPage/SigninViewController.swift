//
//  SigninViewController.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
   @IBAction func signinButtonTapped(_ sender: UIButton) {
            guard let username = usernameTextField.text, !username.isEmpty else {
                // 用户名不能为空
                return
            }

            guard let password = passwordTextField.text, !password.isEmpty else {
                // 密码不能为空
                return
            }

            // 保存用户信息到 UserDefaults
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
            
            // 注册成功后，跳转到登录页面
//            let loginViewController = LoginViewController()
       dismiss(animated: true, completion: nil)
       
//       let aboutVC =  LoginViewController(nibName: " LoginViewController", bundle: nil)
//                   navigationController?.pushViewController(aboutVC, animated: true)
    }
   


   

}
