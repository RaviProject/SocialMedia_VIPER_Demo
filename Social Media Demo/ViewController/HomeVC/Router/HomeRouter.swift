import Foundation
import UIKit

class HomeRouter {
    
    //MARK: - Variable & Constant
    weak var viewController : UIViewController?
}

extension HomeRouter: HomeRouterInput {
    func navigateToCreatePost(user: String) {
        let vc = CreatePostFactory.shared.createModule(user: user)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
