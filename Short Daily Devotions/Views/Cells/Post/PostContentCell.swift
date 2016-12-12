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
    let border = UIView()

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
        border.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        addSubview(border)
        border.autoSetDimension(.width, toSize: 3)
        border.autoPinEdge(.top, to: .top, of: view)
        border.autoPinEdge(.bottom, to: .bottom, of: view)
        border.autoPinEdge(.trailing, to: .leading, of: view, withOffset: -5)
    }
    
    private func setupContent() {
        let attrString = NSMutableAttributedString(string: content)
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        let pgStyle = NSMutableParagraphStyle()
        pgStyle.lineSpacing = 3
        pgStyle.paragraphSpacing = 12
        
        let attrs: [String: Any] = [
            NSParagraphStyleAttributeName: pgStyle,
            NSFontAttributeName: Style.lightFont(withSize: 18)
        ]
        attrString.addAttributes(attrs, range: NSMakeRange(0, content.characters.count))
        contentLabel.attributedText = attrString
        addSubview(contentLabel)
        layoutContent()
    }
    
    private func layoutContent() {
        contentLabel.autoPinEdge(.top, to: .bottom, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(.leading, to: .leading, of: self, withOffset: 8)
        contentLabel.autoPinEdge(.trailing, to: .trailing, of: verseLabel, withOffset: 0)
        contentLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
}
