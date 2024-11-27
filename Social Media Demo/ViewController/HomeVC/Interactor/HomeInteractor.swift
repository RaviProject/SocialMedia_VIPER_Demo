import Foundation

class HomeInteractor {
    
    //MARK: - Variable & Constant
    weak var output : HomeInteractorOutput!
}

//MARK: - LoginInteractorInput
extension HomeInteractor: HomeInteractorInput {
    func loadPosts() {
        if let data = UserDefaults.standard.data(forKey: "UserPosts") {
            do {
                var userPosts: [String: [Post]] = [:]
                var allPosts: [(user: String, post: Post)] = []
                let decoder = JSONDecoder()
                userPosts = try decoder.decode([String: [Post]].self, from: data)
                for (user, posts) in userPosts {
                    for post in posts {
                        allPosts.append((user: user, post: post))
                    }
                }
                output.getPosts(allPosts: allPosts)
                print("User posts loaded successfully!")
            } catch {
                print("Failed to load user posts: \(error)")
            }
        }
    }
}
