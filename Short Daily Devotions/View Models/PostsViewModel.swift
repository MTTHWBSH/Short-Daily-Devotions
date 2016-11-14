//
//  PostsViewModel.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Alamofire

class PostsViewModel: ViewModel {
    
    private var posts: [Post]? {
        didSet {
            render?()
        }
    }
    
    init(postsURL: String) {
        super.init()
        self.loadPosts(postsURL: postsURL)
    }
    
    private func loadPosts(postsURL: String) {
        Alamofire.request(postsURL).responseJSON { [weak self] response in
            guard let data = response.data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let posts = json as? NSArray else { return }
            
            guard let post = posts.firstObject as? NSDictionary else { return }
            print(Post.from(post))
            
            self?.posts = Post.from(posts)
        }
    }
    
    func latestPost() -> Post? {
        return posts?.first
    }
    
}
