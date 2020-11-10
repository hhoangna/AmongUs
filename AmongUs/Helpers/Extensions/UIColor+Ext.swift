//
//  UIColor+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension UIColor {
    convenience init(rgbValue: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hex hexString:String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: &a)
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format:"%06x", rgb)
        }

    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
    func interpolate(with other: UIColor, percent: CGFloat) -> UIColor? {
        return UIColor.interpolate(betweenColor: self, and: other, percent: percent)
    }
    
    static func interpolate(betweenColor colorA: UIColor,
                            and colorB: UIColor,
                            percent: CGFloat) -> UIColor? {
        var redA: CGFloat = 0.0
        var greenA: CGFloat = 0.0
        var blueA: CGFloat = 0.0
        var alphaA: CGFloat = 0.0
        guard colorA.getRed(&redA, green: &greenA, blue: &blueA, alpha: &alphaA) else {
            return nil
        }
        
        var redB: CGFloat = 0.0
        var greenB: CGFloat = 0.0
        var blueB: CGFloat = 0.0
        var alphaB: CGFloat = 0.0
        guard colorB.getRed(&redB, green: &greenB, blue: &blueB, alpha: &alphaB) else {
            return nil
        }
        
        let iRed = CGFloat(redA + percent * (redB - redA))
        let iBlue = CGFloat(blueA + percent * (blueB - blueA))
        let iGreen = CGFloat(greenA + percent * (greenB - greenA))
        let iAlpha = CGFloat(alphaA + percent * (alphaB - alphaA))
        
        return UIColor(red: iRed, green: iGreen, blue: iBlue, alpha: iAlpha)
    }
}
