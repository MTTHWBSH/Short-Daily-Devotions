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

    init(content: String, verse: String) {
        self.verse = verse
        self.content = content
        super.init(style: .default, reuseIdentifier: PostContentCell.kReuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupVerse()
        setupContent()
    }
    
    private func setupVerse() {
        
    }
    
    private func setupContent() {
        
    }
    
    func cellHeight() -> CGFloat {
        return 50.0
    }
    
}
