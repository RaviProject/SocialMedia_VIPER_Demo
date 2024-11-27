import Foundation

class HomePresenter {
    
    //MARK:- Variables & Constant
    weak var view : HomeViewInput!
    var interactor : HomeInteractorInput!
    var router : HomeRouterInput!
    
}

extension HomePresenter : HomeViewOutput {
    func btnCreatePost_Clicked(user: String) {
        router.navigateToCreatePost(user: user)
    }
    
    func loadPosts() {
        interactor.loadPosts()
    }
   
}

extension HomePresenter : HomeInteractorOutput {
    func getPosts(allPosts: [(user: String, post: Post)]) {
        view.getPosts(allPosts: allPosts)
    }
}
