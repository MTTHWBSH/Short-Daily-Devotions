//
//  PostsViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 10/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

enum Posts: Int {
    case Today, Archive
}

class PostsViewController: UIPageViewController {
    
    var viewModel: PostsViewModel
    var postVC: PostViewController
    var archiveVC: ArchiveViewController
    var activityIndicator: UIActivityIndicatorView?
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        self.postVC = PostViewController()
        self.archiveVC = ArchiveViewController()
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [:])
        self.viewModel.render = { [weak self] in self?.render() }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func render() {
        removeActivityIndicator()
        setVC(index:Posts.Today.rawValue, animated: false)
    }
    
    private func setupView() {
        view.backgroundColor = Style.grayLight
        setupNavigationBar()
        addActivityIndicator()
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
    
    private func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        guard let indicator = activityIndicator else { return }
        indicator.startAnimating()
        indicator.color = Style.blue
        view.addSubview(indicator)
        indicator.autoCenterInSuperview()
    }
    
    private func removeActivityIndicator() {
        guard let indicator = activityIndicator else { return }
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
    
    @objc private func setView(sender: UISegmentedControl) {
        setVC(index: sender.selectedSegmentIndex, animated: true)
    }
    
    @objc private func showMoreInfoView() {
        let vc = MoreInfoViewController()
        show(vc, sender: self)
    }
    
    func setVC(index: Int, animated: Bool) {
        switch index {
        case Posts.Today.rawValue:
            guard let post = viewModel.latestPost() else { return }
            let _ = post.formattedContent()
            postVC.viewModel = viewModel.postViewModel(forPost: post)
            setViewControllers([postVC], direction: .reverse, animated: animated, completion: nil)
        case Posts.Archive.rawValue:
            setViewControllers([archiveVC], direction: .forward, animated: animated, completion: nil)
        default: break
        }
    }
    
}

extension PostsViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == archiveVC { return postVC } else { return nil }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == postVC { return archiveVC } else { return nil }
    }
}
