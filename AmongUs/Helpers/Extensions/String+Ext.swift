//
//  String+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension String {
    var localized: String {
        get {
            let path = Bundle.main.path(forResource: "DestinationOfFile", ofType: "lproj")
            let bundle = Bundle(path: path!)
            return NSLocalizedString(self, tableName: "Localized", bundle: bundle!, value: "\(self)", comment: "")
        }
    }
}
