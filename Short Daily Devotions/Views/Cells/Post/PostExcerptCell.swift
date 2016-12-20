//
//  PostExcerptCell.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/13/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PostExcerptCell: UITableViewCell {

    static let kReuseIdentifier = "PostExcerptCell"
    
    var title: String
    var date: String?
    var excerpt: String
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let excerptLabel = UILabel()
    
    init(title: String, date: String?, excerpt: String) {
        self.title = title
        self.date = date
        self.excerpt = excerpt
        super.init(style: .default, reuseIdentifier: PostExcerptCell.kReuseIdentifier)
        self.styleView()
        self.setupTitle()
        self.setupDate()
        self.setupExcerpt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        backgroundColor = Style.grayLight
        selectionStyle = .none
        preservesSuperviewLayoutMargins = false
        separatorInset = .zero
        layoutMargins = .zero
    }
    
    private func setupTitle() {
        titleLabel.text = title.uppercased()
        titleLabel.textColor = Style.blue
        titleLabel.font = Style.boldFont(withSize: 16)
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(20, 8, 0, 8), excludingEdge: .bottom)
    }
    
    private func setupDate() {
        dateLabel.text = date
        dateLabel.font = Style.lightFont(withSize: 14)
        dateLabel.numberOfLines = 0
        addSubview(dateLabel)
        dateLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 5)
        dateLabel.autoPinEdge(.leading, to: .leading, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(.trailing, to: .trailing, of: titleLabel, withOffset: 0)
    }
    
    private func setupExcerpt() {
        excerptLabel.text = excerpt
        excerptLabel.textColor = Style.gray
        excerptLabel.font = Style.regularFont(withSize: 14)
        excerptLabel.numberOfLines = 0
        addSubview(excerptLabel)
        excerptLabel.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: 5)
        excerptLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
        excerptLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 8)
        excerptLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
    }

}
