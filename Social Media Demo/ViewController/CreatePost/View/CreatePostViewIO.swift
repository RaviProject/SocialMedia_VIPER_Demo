import Foundation
import UIKit

//MARK: - Presenter -> View
protocol CreatePostViewInput : AnyObject {
    
}

//MARK: - View -> Presenter
protocol CreatePostViewOutput {
    func savePost(user: String, text: String, img: UIImage)
    func btnBack_Clicked()
}
