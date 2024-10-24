//
//  LoginViewController.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        let signinViewController = SigninViewController(nibName: "SigninViewController", bundle: nil)
        signinViewController.modalPresentationStyle = .fullScreen
        self.present(signinViewController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let savedUsername = UserDefaults.standard.string(forKey: "username"),
              let savedPassword = UserDefaults.standard.string(forKey: "password") else {
            // 未找到已注册的用户信息
            return
        }
        
        guard let enteredUsername = usernameTextField.text, !enteredUsername.isEmpty,
              let enteredPassword = passwordTextField.text, !enteredPassword.isEmpty else {
            // 用户名和密码不能为空
            return
        }
        
        if savedUsername == enteredUsername && savedPassword == enteredPassword {
            // 登录成功
            print("登录成功")
            // 保存用户名到 UserDefaults
            UserDefaults.standard.set(savedUsername, forKey: "username")
            // 保存登录状态
            UserManager.shared.saveLoginState()
            
            // 关闭登录页
            dismiss(animated: true) {
                // 显示主页
                let myTabBarController = MyTabBarController()
                myTabBarController.modalPresentationStyle = .fullScreen
                self.present(myTabBarController, animated: true, completion: nil)
            }
        } else {
            // 用户名或密码错误
            print("用户名或密码错误")
        }
    }
    
    
}
