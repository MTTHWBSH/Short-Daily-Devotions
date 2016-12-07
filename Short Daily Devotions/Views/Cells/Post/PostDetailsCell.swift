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
    
    var title: NSMutableAttributedString
    var date: String?
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    init(title: NSMutableAttributedString, date: String?) {
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
        selectionStyle = .none
    }
    
    private func setupTitle() {
        let attrs: [String: Any] = [
            NSFontAttributeName: Style.boldFont(withSize: 20)
        ]
        title.addAttributes(attrs, range: NSMakeRange(0, title.length))
        titleLabel.attributedText = title
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(8, 8, 8, 8), excludingEdge: .bottom)
    }
    
    private func setupDate() {
        dateLabel.text = date
        dateLabel.font = Style.lightFont(withSize: 14)
        dateLabel.numberOfLines = 0
        addSubview(dateLabel)
        dateLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(.leading, to: .leading, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(.trailing, to: .trailing, of: titleLabel, withOffset: 0)
    }

}
