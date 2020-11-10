//
//  UIViewController+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension UIViewController {
    static func load<T>(SB: SBName, identifier : String? = "") -> T {
        guard let name = identifier, identifier != "" else {
            return UIStoryboard(name: SB.rawValue,
                                bundle: nil)
                .instantiateViewController(withIdentifier: String(describing: T.self)) as! T;
        }
        return UIStoryboard(name: SB.rawValue,
                            bundle: nil)
            .instantiateViewController(withIdentifier: name) as! T;
    }
}
