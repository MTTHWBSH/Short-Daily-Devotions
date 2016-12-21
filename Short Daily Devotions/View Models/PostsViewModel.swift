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
    private var postsURL: String
    private var currentPage = 1
    var allPostsLoaded = false
    
    init(postsURL: String) {
        self.posts = []
        self.postsURL = postsURL
        super.init()
        self.loadPosts(postsURL: postsURL, page: 1, completion: nil)
    }
    
    private func loadPosts(postsURL: String, page: Int, completion: ((Bool) -> Void)?) {
        let params: [String: Any] = ["page": page]
        Alamofire.request(postsURL, parameters: params)
            .responseJSON { [weak self] response in
            guard let data = response.data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let posts = json as? NSArray else { completion?(false); return }
            self?.unwrap(postArray: posts)
            completion?(posts.count >= 1 ? true : false)
        }
    }
    
    private func unwrap(postArray: NSArray) {
        if postArray.count <= 0 { allPostsLoaded = true; return }
        postArray.forEach { json in
            guard let postDict = json as? NSDictionary,
                let post = Post.from(postDict) else { return }
            posts.append(post)
        }
        render?()
    }
    
    // MARK: Post Helpers
    
    func latestPost() -> Post? {
        return posts.first ?? nil
    }
    
    func nextPageOfPosts(completion: ((Void) -> Void)?) {
        let nextPage = currentPage + 1
        loadPosts(postsURL: postsURL, page: nextPage) { [weak self] morePosts in
            guard let strongSelf = self else { return }
            strongSelf.currentPage = morePosts ? nextPage : strongSelf.currentPage
            completion?()
        }
    }
    
    func postViewModel(forPost post: Post) -> PostViewModel {
        return PostViewModel(post: post)
    }
    
    func post(forIndexPath idx: IndexPath) -> Post {
        return posts[idx.row]
    }
    
    // MARK: Archive TableView DataSource
    
    func numberOfPosts() -> Int {
        return posts.count
    }
    
    func cell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let viewModel = postViewModel(forPost: post)
        return PostExcerptCell(title: viewModel.titleString,
                               date: viewModel.dateString,
                               excerpt: viewModel.excerptString)
    }
    
}
