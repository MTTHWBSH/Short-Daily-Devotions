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
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = Style.grayLight
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        addSegControl()
        addMoreInfoButton()
    }
    
    private func addSegControl() {
        let segControl = UISegmentedControl(items: ["Today", "Archive"])
        segControl.selectedSegmentIndex = Posts.Today.rawValue
        segControl.addTarget(self, action: #selector(setView), for: .valueChanged)
        navigationItem.titleView = segControl
    }
    
    private func addMoreInfoButton() {
        let moreInfoButton = UIBarButtonItem(image: UIImage(named: "More"),
                                             style: .plain,
                                             target: self,
                                             action: #selector(showMoreInfoView))
        navigationItem.rightBarButtonItem = moreInfoButton
    }
    
    @objc private func setView(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case Posts.Today.rawValue: setTodayView()
        case Posts.Archive.rawValue: setArchiveView()
        default: break
        }
    }
    
    @objc private func showMoreInfoView() {
        let vc = MoreInfoViewController()
        show(vc, sender: self)
    }
    
    private func setTodayView() {

    }
    
    private func setArchiveView() {

    }

}
