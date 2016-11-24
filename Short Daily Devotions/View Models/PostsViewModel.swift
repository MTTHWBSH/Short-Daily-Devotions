//
//  PostsViewModel.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Alamofire

class PostsViewModel: ViewModel {
    
    private var posts: [Post]
    
    init(postsURL: String) {
        self.posts = []
        super.init()
        self.loadPosts(postsURL: postsURL)
    }
    
    private func loadPosts(postsURL: String) {
        Alamofire.request(postsURL).responseJSON { [weak self] response in
            guard let data = response.data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let posts = json as? NSArray else { return }
            
            posts.forEach { json in
                guard let postDict = json as? NSDictionary,
                let post = Post.from(postDict) else { return }
                self?.posts.append(post)
            }
            self?.render?()
        }
    }
    
    func latestPost() -> Post? {
        return posts.first ?? nil
    }
    
    func postViewModel(forPost post: Post) -> PostViewModel {
        return PostViewModel(post: post)
    }
    
}
