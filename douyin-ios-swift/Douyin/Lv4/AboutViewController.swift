//
//  AboutViewController.swift
//  Douyin
//
//  Created by mac on 26.5.24.
//  Copyright © 2024 Qiao Shi. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        label1.text = "中国平安保险（集团）股份有限公司（以下简称“中国平安” ，“平安保险”，“中国平安保险公司”，“平安集团”）于1988年诞生于深圳蛇口，是中国第一家股份制保险企业，已经发展成为金融保险、银行、投资、医疗健康等业务为一体的多元综合金融服务集团。 [97]\n为香港联合交易所主板及上海证券交易所两地上市公司，股票代码分别为02318和601318。\n 2019年《福布斯》全球2000强第7位，较2018年排名跃升3位。蝉联全球多元保险企业第一，在中国众多入围企业中排名第5，全球金融企业排名第6；《2019年BrandZ最具价值全球品牌100强》公布，中国平安排名第40位；Brand Finance “2019全球品牌价值500强”榜单，中国平安品牌价值位列全球第14位。 [57]在“2019全球最具价值100大保险品牌（Brand Finance Insurance 100 2019）”排行榜中，中国平安荣列榜首；2019年9月1日，2019中国服务业企业500强榜单在济南发布，中国平安保险（集团）股份有限公司排名第3位。 [1]2019年12月，中国平安保险（集团）股份有限公司入选2019中国品牌强国盛典榜样100品牌。 [2]2019年12月18日，人民日报发布中国品牌发展指数100榜单，中国平安排名第20位。 [3]2020年3月，入选2020年全球品牌价值500强第9位。 [4]2020年9月28日，入选2020中国企业500强榜单，排名第六。 [88]2020年《财富》世界500强排行榜第21名，较2019年的29名跃升8名。2021年《财富》世界500强排名第16位"
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
