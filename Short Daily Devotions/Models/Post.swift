//
//  Post.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 10/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Mapper
import Kanna

struct Post: Mappable {
    
    let id: Int
    let title: String
    let content: String
    let date: Date?
    let excerpt: String?
    let doc: HTMLDocument?
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try title = map.from("title.rendered")
        try content = map.from("content.rendered")
        date = map.optionalFrom("date", transformation: extractDate)
        excerpt = map.optionalFrom("excerpt.rendered")
        doc = HTML(html: content, encoding: .utf8)
    }
    
    func formattedBlockQuote() -> String {
        doc?.xpath("//blockquote").forEach { bq in print(bq) }
        return "\(doc?.xpath("//blockquote").first)"
    }
    
    func formattedContent() -> String {
        let formattedDoc = doc
        if let bq = formattedDoc?.xpath("//blockquote").first { formattedDoc?.body?.removeChild(bq) }
        if let firstPg = formattedDoc?.xpath("//p").first { formattedDoc?.body?.removeChild(firstPg) }
        return "\(formattedDoc?.body?.text)"
    }
    
}

fileprivate var formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    return formatter
}()

fileprivate func extractDate(object: Any?) throws -> Date? {
    guard let date = object as? String else {
        throw MapperError.convertibleError(value: object, type: String.self)
    }
    return formatter.date(from: date)
}
