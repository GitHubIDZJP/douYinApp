//
//  hj.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class hj: UIViewController {
    var imageName: String?
    var text: String?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageName = imageName {
                    imageView.image = UIImage(named: imageName)
                }
                
                if let text = text {
                    textView.text = text
                }
    }


   

}
