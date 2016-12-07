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
        selectionStyle = .none
    }
    
    private func setupVerse() {
        verseLabel.text = verse
        verseLabel.numberOfLines = 0
        verseLabel.font = Style.lightItalic(withSize: 18)
        verseLabel.textColor = Style.gray
        addSubview(verseLabel)
        verseLabel.autoPinEdge(.top, to: .top, of: self, withOffset: 30)
        verseLabel.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -8)
        verseLabel.autoPinEdge(.leading, to: .leading, of: self, withOffset: 16)
        addLeftBorder(toView: verseLabel)
    }
    
    private func addLeftBorder(toView view: UIView) {
        let border = UIView()
        border.backgroundColor = Style.gray
        addSubview(border)
        border.autoSetDimension(.width, toSize: 2)
        border.autoPinEdge(.top, to: .top, of: view)
        border.autoPinEdge(.bottom, to: .bottom, of: view)
        border.autoPinEdge(.trailing, to: .leading, of: view, withOffset: -4)
    }
    
    private func setupContent() {
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        let pgStyle = NSMutableParagraphStyle()
        pgStyle.lineSpacing = 5
        let attrs: [String: Any] = [
            NSParagraphStyleAttributeName: pgStyle,
            NSFontAttributeName: Style.lightFont(withSize: 16)
        ]
        contentLabel.attributedText = NSAttributedString(string: content, attributes: attrs)
        addSubview(contentLabel)
        layoutContet()
    }
    
    private func layoutContet() {
        contentLabel.autoPinEdge(.top, to: .bottom, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(.leading, to: .leading, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(.trailing, to: .trailing, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
}
