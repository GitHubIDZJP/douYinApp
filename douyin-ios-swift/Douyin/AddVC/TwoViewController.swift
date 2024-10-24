//
//  TwoViewController.swift
//  CustomTabBarController
//
//  Created by hello on 2019/10/5.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "短视频"
        self.view.backgroundColor = UIColor.white
        
        let a = UIButton.init(frame: CGRect(x: 100, y:200, width: 90, height: 90))
        a.setTitle("短视频", for: .normal)
        a.setTitleColor(.red, for: .normal)
        a.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        self.view.addSubview(a)
//        let douYinVC = AwemeListController.init()
        
    }
    @objc func buttonClicked(_ sender:UIButton){
        let douYinVC = AwemeListController.init()
        self.navigationController?.pushViewController(douYinVC, animated: true)
    }
    

}
