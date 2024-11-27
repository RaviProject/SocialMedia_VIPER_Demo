//
//  String+Extension.swift
//  Pocket Earn
//
//  Created by Ravi Dhaduk on 04/06/24.
//

import Foundation
import UIKit

extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func toString() -> String {
        let strDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormatter.date(from: strDate)
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM, yyyy"
        return dateFormatter1.string(from: date ?? Date())
    }
    
    func toProfileString() -> String {
        let strDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: strDate)
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM, yyyy"
        return dateFormatter1.string(from: date ?? Date())
    }
    
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    func sizeOf(_ font: UIFont) -> CGSize {
        return self.size(withAttributes: [NSAttributedString.Key.font: font])
    }
}

extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor, font: UIFont = Font.regular.size(size: 16)) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range != nil {
            self.addAttributes([NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font:  font, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue], range: range)
        }
    }
    
    
}
