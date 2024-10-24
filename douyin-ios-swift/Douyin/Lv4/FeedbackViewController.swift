//
//  FeedbackViewController.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var FeedbackBtn: UIButton!
    @IBOutlet weak var FeedbackTV: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置代理
                FeedbackTV.delegate = self
        // 初始状态下禁用按钮
               FeedbackBtn.isEnabled = false
        // 设置按钮背景色为灰色
                FeedbackBtn.backgroundColor = UIColor.lightGray
        // 设置提示文字
                FeedbackTV.text = "请输入反馈意见"
                FeedbackTV.textColor = UIColor.lightGray
        
                FeedbackTV.layer.borderWidth = 1.0
               FeedbackTV.layer.borderColor = UIColor.black.cgColor
               FeedbackTV.layer.cornerRadius = 5.0 //
    }
    // 监听 TextView 的文字输入状态
        func textViewDidChange(_ textView: UITextView) {
            // 如果有文字输入，启用按钮
            FeedbackBtn.isEnabled = !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            
            // 根据输入状态设置按钮背景色
            FeedbackBtn.backgroundColor = FeedbackBtn.isEnabled ? UIColor.red : UIColor.lightGray
        }

    func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
        }
        
    func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "请输入反馈意见"
                textView.textColor = UIColor.lightGray
            }
        }
   
    // 点击按钮执行的操作
       @IBAction func feedbackButtonTapped(_ sender: UIButton) {
           // 在这里执行按钮点击后的逻辑
           print("Feedback button tapped")
           
           let alert = UIAlertController(title: nil, message: "提交中...", preferredStyle: .alert)
                  present(alert, animated: true, completion: nil)
                  
                  // 模拟提交成功后的延迟操作
                  DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                      // 隐藏提交中的提示框
                      alert.dismiss(animated: true, completion: {
                          // 提交成功的提示信息
                          let successAlert = UIAlertController(title: nil, message: "提交成功", preferredStyle: .alert)
                          self.present(successAlert, animated: true, completion: nil)
                          
                          // 延迟 2 秒后隐藏成功提示信息
                          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                              successAlert.dismiss(animated: true, completion: nil)
                          }
                      })
                  }
           
       }
}
