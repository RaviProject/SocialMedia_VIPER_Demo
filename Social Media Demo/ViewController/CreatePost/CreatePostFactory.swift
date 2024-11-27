import Foundation
import UIKit

struct CreatePostFactory {
    private static let _shared = CreatePostFactory()
    
    static var shared: CreatePostFactory {
        return _shared
    }
    
    let storyboardId = "CreatePost"
    let initialControllerId = "CreatePostVC"
    
    func createModule(user: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerId) as? CreatePostVC
        //
        let presenter = CreatePostPresenter()
        let interactor = CreatePostInteractor()
        let router = CreatePostRouter()
        //
        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        //
        router.viewController = controller
        //
        interactor.output = presenter
        controller?.output = presenter
        controller?.user = user
        
        return controller!
    }
}
