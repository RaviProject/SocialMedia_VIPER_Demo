import Foundation

//MARK: - Presenter -> View
protocol HomeViewInput : AnyObject {
    func getPosts(allPosts: [(user: String, post: Post)])
}

//MARK: - View -> Presenter
protocol HomeViewOutput {
    func btnCreatePost_Clicked(user: String)
    func loadPosts()
}
