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
    
//    let doc: HTMLDocument?
    let id: Int
    let title: String
    let verse: String
    let content: String
    let date: Date?
    let excerpt: String?
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try title = map.from("title.rendered")
        try verse = map.from("content.rendered", transformation: extractVerse)
        try content = map.from("content.rendered", transformation: extractContent)
        date = map.optionalFrom("date", transformation: extractDate)
        excerpt = map.optionalFrom("excerpt.rendered")
    }
    
}

fileprivate var formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    return formatter
}()

fileprivate func extractDate(object: Any?) throws -> Date? {
    guard let date = object as? String else { throw MapperError.convertibleError(value: object, type: String.self) }
    return formatter.date(from: date)
}

fileprivate func extractVerse(object: Any?) throws -> String {
    guard let obj = object as? String,
        let formattedDoc = HTML(html: obj, encoding: .utf8) else { throw MapperError.convertibleError(value: object, type: String.self) }
    return formattedDoc.xpath("//blockquote").first?.content ?? ""
}

fileprivate func extractContent(object: Any?) throws -> String {
    guard let obj = object as? String,
        let formattedDoc = HTML(html: obj, encoding: .utf8) else { throw MapperError.convertibleError(value: object, type: String.self) }
    if let bq = formattedDoc.xpath("//blockquote").first { formattedDoc.body?.removeChild(bq) }
    if let firstPg = formattedDoc.xpath("//p").first { formattedDoc.body?.removeChild(firstPg) }
    guard let formattedContent = formattedDoc.body?.content else { throw MapperError.convertibleError(value: object, type: String.self) }
    return formattedContent
}
