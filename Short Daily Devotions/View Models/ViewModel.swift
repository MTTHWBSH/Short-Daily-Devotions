//
//  ViewModel.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

public class ViewModel {
    
    public init() {
        
    }
    
    public var render: ((Void) -> Void)? {
        didSet {
            render?()
        }
    }
    
    public func viewWillAppear() {
        render?()
    }
    
}
