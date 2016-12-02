//
//  PostDetailsCell.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/25/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PostDetailsCell: UITableViewCell {
    
    static let kReuseIdentifier = "PostDeatilsCell"
    
    var title: NSAttributedString
    var date: String?
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    init(title: NSAttributedString, date: String?) {
        self.title = title
        self.date = date
        super.init(style: .default, reuseIdentifier: PostDetailsCell.kReuseIdentifier)
        self.styleView()
        self.setupTitle()
        self.setupDate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        backgroundColor = Style.grayLight
    }
    
    private func setupTitle() {
        titleLabel.attributedText = title
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(8, 8, 8, 8), excludingEdge: .bottom)
    }
    
    private func setupDate() {
        dateLabel.text = date
        dateLabel.numberOfLines = 0
        addSubview(dateLabel)
        dateLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(.leading, to: .leading, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(.trailing, to: .trailing, of: titleLabel, withOffset: 0)
    }

}
