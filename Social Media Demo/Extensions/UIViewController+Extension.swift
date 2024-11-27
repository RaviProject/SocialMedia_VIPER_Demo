//
//  UIViewController+Extension.swift
//  Quid
//
//  Created by Ravi Dhaduk on 16/07/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showToast(message : String) {
        let width = message.widthOfString(usingFont: Font.medium.size(size: 14))
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: width + 20, height: 35))
        toastLabel.backgroundColor = UIColor.color_3286ED
        toastLabel.textColor = UIColor.white
        toastLabel.font = Font.medium.size(size: 14)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.center = CGPoint(x: view.frame.size.width  / 2, y: view.frame.size.height - 100)
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func generateBooleanArray(for value: Int) -> [Bool] {
        
        var result: [Bool] = []
        let maxCount = 4
        let milanCount = 2
        
        let cycleLength = maxCount + milanCount
        let fullCycles = value / cycleLength
        
        let remainder = value % cycleLength
        
        for _ in 0..<fullCycles {
            result.append(contentsOf: Array(repeating: false, count: maxCount))
            result.append(contentsOf: Array(repeating: true, count: milanCount))
        }
        
        if remainder > 0 {
            if remainder <= maxCount {
                result.append(contentsOf: Array(repeating: false, count: remainder))
            } else {
                result.append(contentsOf: Array(repeating: false, count: maxCount))
                result.append(contentsOf: Array(repeating: true, count: remainder - maxCount))
            }
        }
        
        return result
    }
}
