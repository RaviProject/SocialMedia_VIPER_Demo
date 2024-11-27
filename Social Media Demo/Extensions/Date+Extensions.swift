//
//  Date+Extensions.swift
//  Quid
//
//  Created by Ravi Dhaduk on 23/07/24.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
