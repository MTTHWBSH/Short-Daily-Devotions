//
//  PostsViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    var viewModel: PostsViewModel
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        let segControl = UISegmentedControl(items: ["Today", "Archive"])
        navigationItem.titleView = segControl
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }

}
