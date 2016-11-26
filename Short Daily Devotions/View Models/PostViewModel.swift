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
    
    private var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter
    }()
    
    private var post: Post
    
    init(post: Post) {
        self.post = post
        super.init()
    }
    
    private var dateString: String? {
        guard let date = post.date else { return nil }
        return formatter.string(from: date)
    }
    
    private func formattedDate(forDate date: Date) -> String { return formatter.string(from: date) }
    
    func postSections() -> Int { return PostSections.count.rawValue }
    
    func cell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case PostSections.details.rawValue: return PostDetailsCell(title: post.title, date: dateString)
        case PostSections.body.rawValue: return PostContentCell(content: post.formattedContent(), verse: post.formattedBlockQuote())
        default: return UITableViewCell()
        }
    }
    
}

