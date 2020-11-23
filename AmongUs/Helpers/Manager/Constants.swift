//
//  Constants.swift
//  AmongUs
//
//  Created by HHumorous on 10/11/2020.
//

import UIKit

enum SBName: String {
    case Main = "Main"
    case Custom = "Custom"
    case Setting = "Setting"
}

struct SERVER_URL {
    static var API: String = "http://178.128.178.232:8761/api/"
}

typealias ResponseDictionary = [String: Any]
