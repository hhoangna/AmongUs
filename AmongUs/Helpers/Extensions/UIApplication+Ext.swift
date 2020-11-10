//
//  UIApplication+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
    
    var currentScene: UIWindowScene? {
        connectedScenes.first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}

extension NSObject {
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
}

extension UIDevice {
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    var iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    enum ScreenType: String {
        case iPhone_4_4S = "iPhone 4 or iPhone 4S"
        case iPhone_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhone_6_6s_7_8 = "iPhone 6, iPhone 6s, iPhone 7 or iPhone 8"
        case iPhone_6Plus_6sPluss_7Plus_8Plus = "iPhone 6 Plus, iPhone 6s Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhone_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR = "iPhone XR"
        case iPhone_XSMax = "iPhone XS Max"
        case unknown
    }

    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone_4_4S
        case 1124:
            return .iPhone_5_5s_5c_SE
        case 1334:
            return .iPhone_6_6s_7_8
        case 1920, 2208:
            return .iPhone_6Plus_6sPluss_7Plus_8Plus
        case 1792:
            return .iPhone_XR
        case 2436:
            return .iPhone_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
}
