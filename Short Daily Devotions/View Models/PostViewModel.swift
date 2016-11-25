//
//  PostViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/23/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Foundation
import UIKit

enum PostSections: Int {
    case details, body, count
}

class PostViewModel: ViewModel {
    
    private var post: Post
    
    init(post: Post) {
        self.post = post
        super.init()
    }
    
    func postSections() -> Int { return PostSections.count.rawValue }
    
    func cell(forPostSection section: IndexPath) -> UITableViewCell {
        switch section {
        case PostSections.details.rawValue: return PostDetailsCell(title: post.title, date: "\(date)")
        case PostSections.body.rawValue: return PostContentCell(content: post.formattedContent(), verse: post.formattedBlockQuote())
        default: return UITableViewCell()
        }
    }
    
}

