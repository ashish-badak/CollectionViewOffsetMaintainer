//
//  ColorPalette.swift
//  CollectionViewOffsetMaintainerDemo
//
//  Created by Ashish Badak on 23/01/23.
//

import Foundation
import UIKit

enum Section: CaseIterable {
    case colorOfTheDay
    case allColors
    case rainbowColors
    case olympicColors
    case primaryColors
    case warmColors
    case coolColors
    case pestal
    case shadesOfBlack
    
    var title: String {
        switch self {
        case .colorOfTheDay: return "Color of the Day"
        case .allColors:  return "Color Pallete"
        case .rainbowColors: return "Rainbow Colors"
        case .olympicColors: return "Olympic Colors"
        case .primaryColors: return "Primary Colors"
        case .warmColors: return "Warm Colors"
        case .coolColors: return "Cool Colors"
        case .pestal: return "Pestal Colors"
        case .shadesOfBlack: return "Shades of Black"
        }
    }
    
    var colors: [UIColor] {
        switch self {
        case .colorOfTheDay:    return [ColorPallete.colorOfTheDay]
        case .allColors:        return ColorPallete.allColors
        case .rainbowColors:    return ColorPallete.rainbow
        case .olympicColors:    return ColorPallete.olympic
        case .primaryColors:    return ColorPallete.primary
        case .warmColors:       return ColorPallete.warm
        case .coolColors:       return ColorPallete.cool
        case .pestal:           return ColorPallete.Pestal
        case .shadesOfBlack:    return ColorPallete.shadesOfBlack
        }
    }
}

enum ColorPallete {
    static var allColors: [UIColor] {
        [.red, .green, .blue, .yellow, .cyan, .orange, .magenta, .brown, .purple, .pink, .indigo, .violet]
    }
    
    static var colorOfTheDay: UIColor = allColors.randomElement() ?? .red
    
    static var primary: [UIColor] { [.red, .blue, .green] }
    
    static var rainbow: [UIColor] {
        [.red, .orange, .yellow, .green, .blue, .indigo, .violet]
    }
    
    static var olympic: [UIColor] {
        [.Olympic.blue, .Olympic.yellow, .black, .Olympic.green, .Olympic.red]
    }
    
    static var warm: [UIColor] {
        [.red, .orange, .yellow, .brown, .pink]
    }
    
    static var cool: [UIColor] {
        [.green, .blue, .indigo, .violet, .cyan, .purple, .magenta]
    }
    
    static var Pestal: [UIColor] {
        [.Pestal.blueGreen, .Pestal.ceil, .Pestal.lavender, .Pestal.queenPink, .Pestal.almond]
    }
    
    static var shadesOfBlack: [UIColor] {
        [.black, .darkGray, .gray, .lightGray]
    }
}

extension UIColor {
    static var violet: UIColor { UIColor(red: 148/255, green: 0, blue: 211/255, alpha: 1) }
    static var indigo: UIColor { UIColor(red: 75/255, green: 0, blue: 130/255, alpha: 1) }
    static var pink: UIColor { UIColor(red: 1, green: 192/255, blue: 203/255, alpha: 1) }
    
    enum Olympic {
        static var blue: UIColor { UIColor(red: 0, green: 133/255, blue: 199/255, alpha: 1) }
        static var yellow: UIColor { UIColor(red: 244/255, green: 195/255, blue: 0, alpha: 1) }
        static var green: UIColor { UIColor(red: 0, green: 159/255, blue: 61/255, alpha: 1) }
        static var red: UIColor { UIColor(red: 223/255, green: 0, blue: 36/255, alpha: 1) }
    }
    
    enum Pestal {
        static var blueGreen: UIColor { UIColor(red: 151/255, green: 207/255, blue: 201/255, alpha: 1) }
        static var ceil: UIColor { UIColor(red: 141/255, green: 174/255, blue: 202/255, alpha: 1) }
        static var lavender: UIColor { UIColor(red: 198/255, green: 181/255, blue: 212/255, alpha: 1) }
        static var queenPink: UIColor { UIColor(red: 198/255, green: 181/255, blue: 212/255, alpha: 1) }
        static var almond: UIColor { UIColor(red: 242/255, green: 226/255, blue: 206/255, alpha: 1) }
    }
}
