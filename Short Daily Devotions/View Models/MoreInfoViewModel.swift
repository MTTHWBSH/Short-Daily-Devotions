//
//  MoreInfoViewModel.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/20/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

enum InfoOptions: Int {
    case about, support, beliefs, contact, social, count
}

class MoreInfoViewModel: ViewModel {
    
    let kFacebookURL    = URL(string: "https://www.facebook.com/shortdailydevotions")
    let kTwitterURL     = URL(string: "https://www.twitter.com/shortdevotions")
    let kInstagramURL   = URL(string: "https://www.instagram.com/shortdailydevotions")
    let kContactEmail   = "shortdailydevotions@gmail.com"
    let kContactAddress = "6098 Red Stag Dr.\nPort Orange, FL 32128"
    
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
        case InfoOptions.social.rawValue:
            return SocialCell(viewModel: self)
        default: return UITableViewCell()
        }
    }
    
    func heightForRow(atIndexPath indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case InfoOptions.about.rawValue, InfoOptions.support.rawValue, InfoOptions.beliefs.rawValue, InfoOptions.contact.rawValue:
            return 80
        case InfoOptions.social.rawValue:
            return 120
        default: return 0
        }
    }
    
    func supportBodyText() -> String {
        return "Help us to continue to reach almost 30,000 people daily with God’s word (through emails and social media). As God continues to bless us and grow, so do our expenses (hosting, email service, maintenance, backups, etc.). We are a 501(c)(3). All financial gifts are considered tax deductible.\nIf you would like to give a normal financial donation, we prefer Aplos Donations below.\nYou can also send checks to:\n6098 Red Stag Dr.\nPort Orange, FL 32128"
    }
}
