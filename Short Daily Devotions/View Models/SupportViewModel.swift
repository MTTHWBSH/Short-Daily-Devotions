//
//  SupportViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Foundation

class SupportViewModel: ViewModel {
    
    private let kTitle          = "Support"
    private let kContactAddress = "6098 Red Stag Dr.\nPort Orange, FL 32128"
    private let kSupportURL     = URL(string: "https://www.aplos.com/aws/give/short_daily_devotions/general")

    func title() -> String { return kTitle }
    func address() -> String { return kContactAddress }
    func donationLink() -> URL? { return kSupportURL }
    
    func content() -> String {
        return "Help us to continue to reach almost 30,000 people daily with God’s word (through emails and social media). As God continues to bless us and grow, so do our expenses (hosting, email service, maintenance, backups, etc.). We are a 501(c)(3). All financial gifts are considered tax deductible.\nIf you would like to give a normal financial donation, we prefer Aplos Donations below.\nYou can also send checks to:\n"
    }
    
}
