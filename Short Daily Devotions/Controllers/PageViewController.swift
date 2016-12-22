//
//  PageViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PageViewController: UIViewController {
    
    var viewModel: PageViewModel
    
    init(viewModel: PageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = viewModel.titleForPage()
    }

}
