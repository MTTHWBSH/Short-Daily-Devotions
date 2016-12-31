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
    
    private let kAboutPageID    = "49"
    private let kBeliefsPageID  = "1981"
    let kFacebookURL            = URL(string: "https://www.facebook.com/shortdailydevotions")
    let kTwitterURL             = URL(string: "https://www.twitter.com/shortdevotions")
    let kInstagramURL           = URL(string: "https://www.instagram.com/shortdailydevotions")
    
    func numberOfOptions() -> Int {
        return InfoOptions.count.rawValue
    }
    
    func cell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case InfoOptions.about.rawValue:   return InfoCell(title: "About")
        case InfoOptions.support.rawValue: return InfoCell(title: "Support")
        case InfoOptions.beliefs.rawValue: return InfoCell(title: "Beliefs")
        case InfoOptions.contact.rawValue: return InfoCell(title: "Contact")
        case InfoOptions.social.rawValue:  return SocialCell(viewModel: self)
        default:                           return UITableViewCell()
        }
    }
    
    func heightForRow(atIndexPath indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case InfoOptions.about.rawValue,
             InfoOptions.support.rawValue,
             InfoOptions.beliefs.rawValue,
             InfoOptions.contact.rawValue: return 80
        case InfoOptions.social.rawValue:  return 120
        default:                           return 0
        }
    }
    
    func viewController(forIndexPath indexPath: IndexPath) -> UIViewController? {
        switch indexPath.row {
        case InfoOptions.about.rawValue:   return PageViewController(viewModel: PageViewModel(pageID: kAboutPageID))
        case InfoOptions.support.rawValue: return SupportViewController(viewModel: SupportViewModel())
        case InfoOptions.beliefs.rawValue: return PageViewController(viewModel: PageViewModel(pageID: kBeliefsPageID))
        case InfoOptions.contact.rawValue: return ContactViewController(viewModel: ContactViewModel())
        default: return nil
        }
    }

}
