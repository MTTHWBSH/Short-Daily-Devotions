//
//  TodayViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 11/22/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Today"
        view.addSubview(label)
        label.autoCenterInSuperview()
    }
    
}
