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
    
    var title: String
    var date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
        super.init()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTitle()
        setupDate()
    }
    
    private func setupTitle() {
        
    }
    
    private func setupDate() {
        
    }

}
