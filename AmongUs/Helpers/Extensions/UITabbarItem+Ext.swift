//
//  UITabbarItem+Ext.swift
//  AnniCount-
//
//  Created by HHumorous on 13/10/2020.
//

import UIKit

extension UITabBarItem {
    static func customTabBarItem(image: UIImage, title: String) -> UITabBarItem {
        let item = UITabBarItem()
        item.title = title
        item.image = image
        item.selectedImage = image
        
        return item
    }
}

