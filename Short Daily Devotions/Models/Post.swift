//
//  Post.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 10/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Mapper

struct Post: Mappable {
    
    let id: Int
    let title: String?
    let date: Date?
    let author: String?
    let excerpt: String?
    let content: String?
    
    init(map: Mapper) throws {
        try id = map.from("id")
        title = map.optionalFrom("title.rendered")
        date = map.optionalFrom("date", transformation: extractDate)
        author = map.optionalFrom("author")
        excerpt = map.optionalFrom("excerpt.rendered")
        content = map.optionalFrom("content.rendered")
    }
    
}

fileprivate func extractDate(object: Any?) throws -> Date? {
    guard let date = object as? String else {
        throw MapperError.convertibleError(value: object, type: String.self)
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: date)
}
