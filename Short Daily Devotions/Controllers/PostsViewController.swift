//
//  PostsViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

enum Posts: Int {
    case Today = 0, Archive
}

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
        addSegControl()
    }
    
    private func addSegControl() {
        let segControl = UISegmentedControl(items: ["Today", "Archive"])
        segControl.backgroundColor = Style.blue
        segControl.tintColor = Style.blue
        segControl.addTarget(self, action: #selector(setView), for: .valueChanged)
        navigationItem.titleView = segControl
    }
    
    private func setupView() {
        view.backgroundColor = Style.grayLight
    }
    
    @objc private func setView(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case Posts.Today.rawValue: setTodayView()
        case Posts.Archive.rawValue: setArchiveView()
        default: break
        }
    }
    
    private func setTodayView() {
        print("recent view")
    }
    
    private func setArchiveView() {
        print("archive view")
    }

}
