//
//  OneViewController.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "校园向导"
    }
//公租房
    @IBAction func RentingPublicHousing(_ sender: UIButton) {
        navigateToDetail(imageName: "公租房", text: "由保障对象与公租房运营机构签订租赁合同；单位承租的，由单位与公租房运营机构签订租赁合同，入住保障对象与单位签订房屋使用相关协议书作为租赁合同附件。部分房源不足的项目，由公租房运营机构制定相应规则实行轮候配租。也可以通过“一网通办”线上申请")
//        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
//        let h = hj.init(nibName: "detailVC", bundle: nil)
//                        detailVC.imageName = imageName
//                        detailVC.text = text
       
       
                    
    }
    
//    建金大楼
    @IBAction func JianJinHouse(_ sender: UIButton) {
//        navigatet
        
        navigateToDetail(imageName: "建金大楼", text: "位于静安北京西路1399号(靠近常德路路口),位置不错,交通还是很便利的")
    }
//    保卫处
    @IBAction func SecurityDepartment(_ sender: UIButton) {
        navigateToDetail(imageName: "保卫处", text: "治安科保卫楼201室52104831")
    }
//    荣礼楼
    @IBAction func RongLiHouse(_ sender: UIButton) {
        navigateToDetail(imageName: "荣礼楼", text: "江苏金亚房地产公司开发建设。项目位于鼓楼区新模范马路与水佐岗交汇处,邻近中山东路,直达玄武湖地下隧道。规划中的四层城西干道(虑踞北路)高架延伸至本项目位置")
    }
    
    
    @IBAction func LibraryHouse(_ sender: UIButton) {
        navigateToDetail(imageName: "图书馆", text: "图书馆，是搜集、整理、收藏图书资料以供人阅览、参考的机构，早在公元前3000年就出现了图书馆，图书馆有保存人类文化遗产、开发信息资源、参与社会教育等职能。图书馆是社会记忆（通常表现为书面记录信息）的外存和选择传递机制。换句话说，图书馆是社会知识、信息、文化的记忆装置、扩散装置")
    }
    private func navigateToDetail(imageName: String, text: String) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
//                detailVC.imageName = imageName
//                detailVC.text = text
//                navigationController?.pushViewController(detailVC, animated: true)
//            }
        let h = hj.init(nibName: "hj", bundle: nil)
        h.imageName = imageName
        h.text = text
        navigationController?.pushViewController(h, animated: true)
        }
    //    图书馆
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
