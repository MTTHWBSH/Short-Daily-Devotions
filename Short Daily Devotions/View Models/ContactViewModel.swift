//
//  ContactViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

class ContactViewModel: ViewModel {
    
    private let kTitle          = "Contact"
    private let kContactEmail   = "shortdailydevotions@gmail.com"
    private let kContactAddress = "6098 Red Stag Dr.\nPort Orange, FL 32128"
    
    func title() -> String { return kTitle }
    func address() -> String { return kContactAddress }
    func emailAddress() -> String { return kContactEmail }
    
}
