//
//  PostContentCell.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/25/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PostContentCell: UITableViewCell {
    
    static let kReuseIdentifier = "PostContentCell"
    
    var verse: String
    var content: String
    
    let verseLabel = UILabel()
    let contentLabel = UILabel()

    init(verse: String, content: String) {
        self.verse = verse
        self.content = content
        super.init(style: .default, reuseIdentifier: PostContentCell.kReuseIdentifier)
        self.styleView()
        self.setupVerse()
        self.setupContent()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        backgroundColor = Style.grayLight
    }
    
    private func setupVerse() {
        verseLabel.text = verse
        verseLabel.numberOfLines = 0
        addSubview(verseLabel)
        verseLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(8, 8, 8, 8), excludingEdge: .bottom)
    }
    
    private func setupContent() {
        contentLabel.text = content
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        addSubview(contentLabel)
        contentLabel.autoPinEdge(.top, to: .bottom, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(.leading, to: .leading, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(.trailing, to: .trailing, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
}
