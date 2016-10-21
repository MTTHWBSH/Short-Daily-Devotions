//
//  PostsViewModel.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Alamofire

class PostsViewModel: ViewModel {
    
    init(postsURL: String) {
        super.init()
        self.loadPosts(postsURL: postsURL)
    }
    
    private func loadPosts(postsURL: String) {
        Alamofire.request(postsURL).responseJSON { response in
            
        }
    }
    
}
