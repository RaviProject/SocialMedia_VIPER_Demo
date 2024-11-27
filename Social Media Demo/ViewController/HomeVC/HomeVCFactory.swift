import Foundation
import UIKit

struct HomeFactory {
    private static let _shared = HomeFactory()
    
    static var shared: HomeFactory {
        return _shared
    }
    
    let storyboardId = "Home"
    let initialControllerId = "HomeVC"
    
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerId) as? HomeVC
        //
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        //
        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        //
        router.viewController = controller
        //
        interactor.output = presenter
        controller?.output = presenter
        
        return controller!
    }
}
