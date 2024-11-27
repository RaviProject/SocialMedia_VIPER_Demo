import Foundation
import UIKit

class CreatePostRouter {
    
    //MARK: - Variable & Constant
    weak var viewController : UIViewController?
}

extension CreatePostRouter : CreatePostRouterInput {
    func back() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
   
}
