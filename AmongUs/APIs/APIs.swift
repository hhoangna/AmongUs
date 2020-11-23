//
//  APIs.swift
//  AmongUs
//
//  Created by HHumorous on 21/11/2020.
//

import UIKit

extension BaseAPI {
    func getListIconAmongUs(callback: @escaping BaseDtoCallback<[IconModel]>) {
        requestAPI(path: "icon", method: .get, params: ["page": 0, "size": 100]) { (sucess, json) in
            if sucess {
                if let list = IconListModel(JSON: json) {
                    callback(true, list.data)
                } else {
                    callback(false, [])
                }
            } else {
                callback(false, [])
            }
        }
    }
}
