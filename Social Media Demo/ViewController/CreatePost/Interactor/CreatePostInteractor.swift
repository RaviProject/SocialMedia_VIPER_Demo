import Foundation
import UIKit

class CreatePostInteractor {
    
    //MARK: - Variable & Constant
    weak var output : CreatePostInteractorOutput!
}

//MARK: - HomeInteractorInput
extension CreatePostInteractor: CreatePostInteractorInput {
    func savePost(user: String, text: String, img: UIImage) {
        var userPosts: [String: [Post]] = [:]
        if let data = UserDefaults.standard.data(forKey: "UserPosts") {
            do {
                let decoder = JSONDecoder()
                userPosts = try decoder.decode([String: [Post]].self, from: data)
                let post = Post(text: text, image: img)
                
                if userPosts[user] != nil {
                    userPosts[user]?.append(post)
                } else {
                    userPosts[user] = [post]
                }
                
                // Save to UserDefaults after adding a post
                saveUserPostsToUserDefaults(userPosts: userPosts)
            } catch {
            }
        } else {
            let post = Post(text: text, image: img)
            
            if userPosts[user] != nil {
                userPosts[user]?.append(post)
            } else {
                userPosts[user] = [post]
            }
            
            // Save to UserDefaults after adding a post
            saveUserPostsToUserDefaults(userPosts: userPosts)
        }
    }
    
    func saveUserPostsToUserDefaults(userPosts: [String: [Post]]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userPosts)
            UserDefaults.standard.set(data, forKey: "UserPosts")
            print("User posts saved successfully!")
            output.backToFeed()
        } catch {
            print("Failed to save user posts: \(error)")
        }
    }
}
