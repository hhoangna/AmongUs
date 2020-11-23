//
//  EmptyModel.swift
//  AmongUs
//
//  Created by HHumorous on 21/11/2020.
//

import UIKit
import ObjectMapper

class EmptyModel: BaseModel {
    var message: String = ""
    var error: Bool = false
    
    override func mapping(map: Map) {
        message <- map["message"]
        error <- map["error"]
    }
}
