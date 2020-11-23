//
//  IconModel.swift
//  AmongUs
//
//  Created by HHumorous on 20/11/2020.
//

import UIKit
import ObjectMapper

class IconModel: BaseModel {
    var _id: Int = 0
    var type: String = ""
    var url: String = ""
    
    override func mapping(map: Map) {
        _id <- map["id"]
        type <- map["type"]
        url <- map["url"]
    }
}

class IconListModel: BaseModel {
    var data: [IconModel] = []
    var error: Bool = false
    var message: String = ""
    
    override func mapping(map: Map) {
        data <- map["data"]
        error <- map["error"]
        message <- map["message"]
    }
}
