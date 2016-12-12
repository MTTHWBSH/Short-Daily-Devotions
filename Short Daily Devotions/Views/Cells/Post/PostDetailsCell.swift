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
    
    var title: String
    var date: String?
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    init(title: String, date: String?) {
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
        titleLabel.text = title.uppercased()
        titleLabel.textColor = Style.blue
        titleLabel.font = Style.boldFont(withSize: 20)
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(20, 8, 0, 8), excludingEdge: .bottom)
    }
    
    private func setupDate() {
        dateLabel.text = date
        dateLabel.font = Style.lightFont(withSize: 16)
        dateLabel.numberOfLines = 0
        addSubview(dateLabel)
        dateLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 5)
        dateLabel.autoPinEdge(.leading, to: .leading, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(.trailing, to: .trailing, of: titleLabel, withOffset: 0)
        dateLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }

}
