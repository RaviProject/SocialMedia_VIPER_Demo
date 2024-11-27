import Foundation
import UIKit

class CreatePostPresenter {
    
    //MARK:- Variables & Constant
    weak var view : CreatePostViewInput!
    var interactor : CreatePostInteractorInput!
    var router : CreatePostRouterInput!
    
}

extension CreatePostPresenter : CreatePostViewOutput {
    func savePost(user: String, text: String, img: UIImage) {
        interactor.savePost(user: user,text: text, img: img)
    }
    
    func btnBack_Clicked() {
        router.back()
    }
}

extension CreatePostPresenter : CreatePostInteractorOutput {
    func backToFeed() {
        router.back()
    }
}
