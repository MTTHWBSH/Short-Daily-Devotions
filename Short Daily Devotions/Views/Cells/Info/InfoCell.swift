//
//  AboutCell.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/20/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    static let kReuseIdentifier = "InfoCell"
    
    var title: String
    
    let titleLabel = UILabel()
    
    init(title: String) {
        self.title = title
        super.init(style: .default, reuseIdentifier: InfoCell.kReuseIdentifier)
        self.styleView()
        self.setupTitle()
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
        titleLabel.autoCenterInSuperview()
    }

}
