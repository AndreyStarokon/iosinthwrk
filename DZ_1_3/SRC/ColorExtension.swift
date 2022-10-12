//
//  ColorExtension.swift
//  DZ_1_3
//
//  Created by Ffhh Qerg on 28.03.2022.
//

import UIKit

extension UIColor {
  
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
extension UIColor {
    static var backgroundColor: UIColor {
        Self.makeColor(light: .white, dark: .black)
    }

    static var fieldColor: UIColor {
        Self.makeColor(light: .white, dark: .darkGray)
    }
    static var buttonColor: UIColor {
        Self.makeColor(light: .systemBlue, dark: .systemRed)
    }
    static var textCollor: UIColor {
        Self.makeColor(light: .black, dark: .white)
    }
    private static func makeColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { traitCollection -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .light, .unspecified:
                    return light
                case .dark:
                    return dark
                @unknown default:
                    assertionFailure("Case is not supported")
                    return .red
                }
            }
        } else {
            return .red
        }
    }
}
