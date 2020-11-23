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

enum ColorText: String, CaseIterable {
    case colorffffff = "ffffff"
    case colorffd783 = "ffd783"
    case colorff9383 = "ff9383"
    case color83b8ff = "83b8ff"
    case colora6ffa2 = "a6ffa2"
    case colorcda2ff = "cda2ff"
    case colora2c4ff = "a2c4ff"
}

enum FontText: String, CaseIterable {
    case GoogleSans = "GoogleSans-Medium"
    case Avenir = "Avenir"
    case SFPro = "SFPro"
    case Baskerville = "Baskerville"
    case Amatic_Bold = "AmaticSC-Bold"
    case Cardo_Bold = "Cardo-Bold"
    case CircularStd_Book = "CircularStd-Book"
    case SalesforceSans_Bold = "SalesforceSans-Bold"
    case GochiHand_Regular = "GochiHand-Regular"
    case SparkleDream = "Sparkle Dream"
    case DavidLibre_Bold = "DavidLibre-Bold"
    case Neucha_Regular = "Neucha"
    case Pangolin_Regular = "Pangolin-Regular"
    case HelloValentina = "Hello Valentica Regular"
    case Chilanka_Regular = "Chilanka-Regular"
    case Nunito_Regular = "Nunito-Regular"
    case r0c0i = "r0c0iLinotte-Bold"
    case CrimsonText = "CrimsonText-Regular"
    case Courgette_Regular = "Courgette-Regular"
    case RoundoRegular = "Roundo"
    case GloriaHallelujah_Regular = "GloriaHallelujah"
    case LibreBaskerville_Bold = "LibreBaskerville-Bold"
    case Montserrat_Bold = "Montserrat-Bold"
    case Martel_Regular = "Martel-Regular"
    case PermanentMarker_Regular = "PermanentMarker-Regular"
    case Satisfy_Regular = "Satisfy-Regular"
    
    var title: String {
        switch self {
        case .GoogleSans: return "GoogleSans"
        case .Avenir: return "Avenir"
        case .SFPro: return "SFPro"
        case .Baskerville: return "Baskerville"
        case .Amatic_Bold: return "AmaticSC"
        case .Cardo_Bold: return "Cardo"
        case .CircularStd_Book: return "CircularStd"
        case .SalesforceSans_Bold: return "SalesforceSans"
        case .GochiHand_Regular: return "GochiHand"
        case .SparkleDream: return "Sparkle Dream"
        case .DavidLibre_Bold: return "DavidLibre"
        case .Neucha_Regular: return "Neucha"
        case .Pangolin_Regular: return "Pangolin"
        case .HelloValentina: return "Hello Valentica"
        case .Chilanka_Regular: return "Chilanka"
        case .Nunito_Regular: return "Nunito"
        case .r0c0i: return "Linotte"
        case .CrimsonText: return "CrimsonText"
        case .Courgette_Regular: return "Courgette"
        case .RoundoRegular: return "Roundo"
        case .GloriaHallelujah_Regular: return "GloriaHallelujah"
        case .LibreBaskerville_Bold: return "LibreBaskerville"
        case .Montserrat_Bold: return "Montserrat"
        case .Martel_Regular: return "Martel"
        case .PermanentMarker_Regular: return "PermanentMarker"
        case .Satisfy_Regular: return "Satisfy"
        }
    }
}

enum AlignmentText: Int {
    case Left = 0
    case Center
    case Right
}
