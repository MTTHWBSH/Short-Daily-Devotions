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
    private var processed = false
    
    init(post: Post) {
        self.post = post
        super.init()
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
    
    private func formattedBlockQuote() -> String {
        return post.doc?.xpath("//blockquote").first?.content ?? ""
    }
    
    private func formattedContent() -> String {
        let formattedDoc = post.doc
        if !processed {
            if let bq = formattedDoc?.xpath("//blockquote").first { formattedDoc?.body?.removeChild(bq) }
            if let firstPg = formattedDoc?.xpath("//p").first { formattedDoc?.body?.removeChild(firstPg) }
            processed = true
        }
        guard let formattedContent = formattedDoc?.body?.content else { return "" }
        return formattedContent
    }
    
    // MARK: TableView DataSource
    
    func postSections() -> Int { return PostSections.count.rawValue }
    
    func cell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case PostSections.details.rawValue: return PostDetailsCell(title: titleString, date: dateString)
        case PostSections.body.rawValue:    return PostContentCell(verse: formattedBlockQuote(), content: formattedContent())
        default: return UITableViewCell()
        }
    }
    
}
