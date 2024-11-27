//
//  UIColor+Extension.swift
//  Pocket Earn
//
//  Created by Ravi Dhaduk on 5/8/24.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                  green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                  blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                  alpha: alpha)
    }
        
    class var color_main: UIColor {
        return UIColor(named: "color_main") ?? .black
    }
    
    class var color_detail: UIColor {
        return UIColor(named: "color_detail") ?? .black
    }
    
    class var color_0E4580: UIColor {
        return UIColor(named: "color_0E4580") ?? .black
    }
    
    class var color_3286ED: UIColor {
        return UIColor(named: "color_3286ED") ?? .black
    }
    
    class var color_F1F8FE: UIColor {
        return UIColor(named: "color_F1F8FE") ?? .black
    }
    
    class var color_FF7115: UIColor {
        return UIColor(named: "color_FF7115") ?? .black
    }
    
    class var color_gray4: UIColor {
        return UIColor(named: "color_gray4") ?? .black
    }
}
