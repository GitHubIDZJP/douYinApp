//
//  Visitor.swift
//  Douyin
//
//  Created by Qiao Shi on 2018/8/2.
//  Copyright © 2018年 Qiao Shi. All rights reserved.
//

import Foundation

class Visitor: BaseModel {
    var uid:String?
    var udid:String?
    var avatar_thumbnail:PictureInfo?
    var avatar_medium:PictureInfo?
    var avatar_large:PictureInfo?
    
    static func write(visitor:Visitor) {
        let dic = visitor.toJSON()
        let defaults = UserDefaults.standard
        defaults.set(dic, forKey: "visitor")
        defaults.synchronize()
    }
    
    static func read() -> Visitor {
        let defaults = UserDefaults.standard
        if let dic = defaults.object(forKey: "visitor") as? [String:AnyObject] {
            if let visitor = Visitor.deserialize(from: dic) {
                return visitor
            }
        }
        // 如果无法从 UserDefaults 中读取到数据，或者数据格式不正确，则返回一个默认的 Visitor 对象
        return Visitor()
    }

    
    static func formatUDID(udid:String) -> String {
        
        if udid.count < 8 {
            return "************"
        }
        return udid.substring(location: 0, length:4) + "****" + udid.substring(location: udid.count - 4, length:4)
    }
}
