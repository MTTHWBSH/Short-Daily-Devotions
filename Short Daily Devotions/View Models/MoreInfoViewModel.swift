//
//  MoreInfoViewModel.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/20/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

enum InfoOptions: Int {
    case about, support, beliefs, contact, count
}

class MoreInfoViewModel: ViewModel {
    
    func numberOfOptions() -> Int {
        return InfoOptions.count.rawValue
    }
    
    func cell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case InfoOptions.about.rawValue:
            return InfoCell(title: "About")
        case InfoOptions.support.rawValue:
            return InfoCell(title: "Support")
        case InfoOptions.beliefs.rawValue:
            return InfoCell(title: "Beliefs")
        case InfoOptions.contact.rawValue:
            return InfoCell(title: "Contact")
        default: return UITableViewCell()
        }
    }
    
    func supportBodyText() -> String {
        return "Help us to continue to reach almost 30,000 people daily with God’s word (through emails and social media). As God continues to bless us and grow, so do our expenses (hosting, email service, maintenance, backups, etc.). We are a 501(c)(3). All financial gifts are considered tax deductible.\nIf you would like to give a normal financial donation, we prefer Aplos Donations below.\nYou can also send checks to:\n6098 Red Stag Dr.\nPort Orange, FL 32128"
    }
}
