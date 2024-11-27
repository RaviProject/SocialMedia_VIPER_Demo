import Foundation
import UIKit

//MARK: -
protocol CreatePostInteractorOutput: AnyObject {
    func backToFeed()
}

protocol CreatePostInteractorInput {
    func savePost(user: String, text: String, img: UIImage)
}
