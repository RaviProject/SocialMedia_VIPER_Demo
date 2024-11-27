import Foundation

//MARK: -
protocol HomeInteractorOutput: AnyObject {
    func getPosts(allPosts: [(user: String, post: Post)])
}

protocol HomeInteractorInput {
    func loadPosts()
}
