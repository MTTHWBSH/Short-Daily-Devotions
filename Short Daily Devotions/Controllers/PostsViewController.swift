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
    case today, archive
}

class PostsViewController: UIPageViewController {
    
    var viewModel: PostsViewModel
    var postVC: PostViewController
    var archiveVC: ArchiveViewController
    var activityIndicator: UIActivityIndicatorView?
    var refreshControl: UIRefreshControl?
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
        self.postVC = PostViewController(refreshEnabled: true)
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
        setVC(index:Posts.today.rawValue, animated: false)
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
        segControl.selectedSegmentIndex = Posts.today.rawValue
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
        vc.viewModel = MoreInfoViewModel()
        show(vc, sender: self)
    }
    
    func setVC(index: Int, animated: Bool) {
        switch index {
        case Posts.today.rawValue:
            guard let post = viewModel.latestPost() else { return }
            postVC.viewModel = viewModel.postViewModel(forPost: post)
            setViewControllers([postVC], direction: .reverse, animated: animated, completion: nil)
        case Posts.archive.rawValue:
            archiveVC.viewModel = viewModel
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
