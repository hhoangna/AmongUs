//
//  BaseModel.swift
//  AmongUs
//
//  Created by HHumorous on 20/11/2020.
//

import UIKit
import ObjectMapper

typealias BaseDtoCallback<T> = (_ success: Bool, _ object: T?) -> Void
typealias ArrayDtoCallback<T> = (_ success: Bool, _ objects: T?) -> Void

class BaseModel: NSObject, Mappable {
    override init() {
        super.init()
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {}
    
    func getJSONString() -> [String: Any] {
        let json = self.toJSON()
        return json
    }
}
