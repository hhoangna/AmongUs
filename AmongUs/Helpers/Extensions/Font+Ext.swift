//
//  Font+Ext.swift
//  AnniCount-
//
//  Created by HHumorous on 15/10/2020.
//

import SwiftUI

extension Font {
    static func sfProTextMedium(size: CGFloat) -> Font {
        return custom("SFProText-Medium", size: size)
    }
    
    static func sfProTextBold(size: CGFloat) -> Font {
        return custom("SFProText-Bold", size: size)
    }
    
    static func sfProTextRegular(size: CGFloat) -> Font {
        return custom("SFProText-Regular", size: size)
    }
    
    static func sfProTextSemibold(size: CGFloat) -> Font {
        return custom("SFProText-Semibold", size: size)
    }
    
    static func avertaStdCYBold(size: CGFloat) -> Font {
        return custom("AvertaStdCY-Bold", size: size)
    }
    
    static func avertaStdCYMedium(size: CGFloat) -> Font {
        return custom("AvertaStdCY-Medium", size: size)
    }
    
    static func avertaStdCYRegular(size: CGFloat) -> Font {
        return custom("AvertaStdCY-Regular", size: size)
    }
    
    static func googleSansBlack(size: CGFloat) -> Font {
        return custom("GoogleSans-Black", size: size)
    }
    
    static func googleSansBold(size: CGFloat) -> Font {
        return custom("GoogleSans-Bold", size: size)
    }
    
    static func googleSansMedium(size: CGFloat) -> Font {
        return custom("GoogleSans-Medium", size: size)
    }
    
    static func googleSansRegular(size: CGFloat) -> Font {
        return custom("GoogleSans-Regular", size: size)
    }
}

