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
    
    init(title: String, date: String?, excerpt: String) {
        self.title = title
        self.date = date
        self.excerpt = excerpt
        super.init(style: .default, reuseIdentifier: PostExcerptCell.kReuseIdentifier)
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

    }

}
