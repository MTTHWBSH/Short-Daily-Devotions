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
        border.backgroundColor = Style.gray
        addSubview(border)
        border.autoSetDimension(.width, toSize: 2)
        border.autoPinEdge(.top, to: .top, of: view)
        border.autoPinEdge(.bottom, to: .bottom, of: view)
        border.autoPinEdge(.trailing, to: .leading, of: view, withOffset: -6)
    }
    
    private func setupContent() {
        let attrString = NSMutableAttributedString(string: content)
        
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        let pgStyle = NSMutableParagraphStyle()
        pgStyle.lineSpacing = 5
        
        let attrs: [String: Any] = [
            NSParagraphStyleAttributeName: pgStyle,
            NSFontAttributeName: Style.lightFont(withSize: 16)
        ]
        attrString.addAttributes(attrs, range: NSMakeRange(0, content.characters.count))
        pgStyle.lineSpacing = 50
        attrString.attributes(forPattern: "\n",
                              in: content,
                              withAttributes: [NSParagraphStyleAttributeName: pgStyle])
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

fileprivate extension NSMutableAttributedString {
    func attributes(forPattern regex: String,in text: String,withAttributes attributes: [String: Any]) {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            regex.enumerateMatches(in: text,
                                   options: [],
                                   range: NSMakeRange(0,text.characters.count),
                                   using: { match, _, _ in
                                    
                guard let subRange = match?.rangeAt(1) else { return }
                attributes.forEach({ key, value in
                    self.addAttribute(key, value: value, range: subRange)
                })
            })
        } catch let error { print("invalid regex: \(error.localizedDescription)") }
    }
}
