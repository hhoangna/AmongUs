//
//  UIFont+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension UIFont {
    static func sfProDisplayBold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Bold", size: size) ?? .googleSansBold(size: size)
    }
    
    static func sfProDisplayMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Medium", size: size)!
    }
    
    static func sfProDisplayRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Regular", size: size)!
    }
    
    static func sfProDisplaySemibold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProText-Semibold", size: size)!
    }
    
    static func avertaStdCYBold(size: CGFloat) -> UIFont {
        return UIFont(name: "AvertaStdCY-Bold", size: size)!
    }
    
    static func avertaStdCYMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "AvertaStdCY-Medium", size: size)!
    }
    
    static func avertaStdCYRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "AvertaStdCY-Regular", size: size)!
    }
    
    static func googleSansBlack(size: CGFloat) -> UIFont {
        return UIFont(name: "GoogleSans-Black", size: size)!
    }
    
    static func googleSansBold(size: CGFloat) -> UIFont {
        return UIFont(name: "GoogleSans-Bold", size: size)!
    }
    
    static func googleSansMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "GoogleSans-Medium", size: size)!
    }
    
    static func googleSansRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "GoogleSans-Regular", size: size)!
    }
}
