//
//  PostViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/23/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

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
    
    func refreshPost(completion: ((Bool) -> Void)?) {
        let params: [String: Any] = [
            "page": 1,
            "per_page": 1
        ]
        
        Alamofire.request("\(Constants.kPostsBaseURL)", parameters: params)
            .responseJSON { [weak self] response in
                guard let data = response.data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []),
                    let posts = json as? NSArray else { completion?(false); return }
                self?.unwrap(postArray: posts)
                completion?(posts.count >= 1 ? true : false)
        }
    }
    
    private func unwrap(postArray: NSArray) {
        postArray.forEach { [weak self] json in
            guard let postDict = json as? NSDictionary,
                let post = Post.from(postDict) else { return }
            self?.post = post
        }
        render?()
    }
    
    var dateString: String? {
        guard let date = post.date else { return nil }
        return formattedDate(forDate: date)
    }
    
    var titleString: String {
        return formattedString(forHTMLString: post.title)
    }
    
    var excerptString: String {
        guard let excerpt = post.excerpt?
            .replacingOccurrences(of: "Daily Devotional Bible Verses", with: "")
            .replacingOccurrences(of: "Daily Devotional Bible Verse", with: "")
            .replacingOccurrences(of: "Read more&#8230;", with: "") else { return "" }
        return formattedString(forHTMLString: excerpt)
    }
    
    // MARK: Post Formatting
    
    private func formattedDate(forDate date: Date) -> String { return formatter.string(from: date) }
    
    private func formattedString(forHTMLString string: String) -> String {
        guard let stringData = string.data(using: String.Encoding.unicode, allowLossyConversion: true),
            let attr = try? NSMutableAttributedString(data: stringData,
                                                      options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                                      documentAttributes: nil) else { return "" }
        return attr.string
    }
    
    // MARK: TableView DataSource
    
    func postSections() -> Int { return PostSections.count.rawValue }
    
    func cell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case PostSections.details.rawValue: return PostDetailsCell(title: titleString, date: dateString)
        case PostSections.body.rawValue:    return PostContentCell(verse: post.verse, content: post.content)
        default: return UITableViewCell()
        }
    }
    
}
