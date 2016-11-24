//
//  PostViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/23/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Foundation
import UIKit

class PostViewModel: ViewModel {
    
    private var post: Post
    
    init(post: Post) {
        self.post = post
        super.init()
    }
    
    func postSections() -> Int { return 2 }
    
    func cell(forPostSection section: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

