//
//  MoreInfoViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/1/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class MoreInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = "Info"
        view.backgroundColor = Style.grayLight
    }

}
