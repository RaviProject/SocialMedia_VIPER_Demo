//
//  Post.swift
//  Social Media Demo
//
//  Created by Ravi Dhaduk on 27/11/24.
//

import Foundation
import UIKit

struct Post: Codable {
    
    let text: String
    let imageData: Data? // Store the image as Data
    
    // Helper to initialize a post with a UIImage
    init(text: String, image: UIImage?) {
        self.text = text
        self.imageData = image?.jpegData(compressionQuality: 0.8)
    }
    
    // Helper to get UIImage from imageData
    func getImage() -> UIImage? {
        guard let imageData = imageData else { return nil }
        return UIImage(data: imageData)
    }
}
