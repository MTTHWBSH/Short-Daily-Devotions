//
//  ArchiveViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 11/22/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class ArchiveViewController: UITableViewController {
    
    var footerView: UITableViewHeaderFooterView = { return PostsLoadingFooterView() }()
    var viewModel: PostsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel?.render = { [weak self] in self?.render() }
    }
    
    private func render() {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        registerCells()
        tableView.sectionFooterHeight = 0
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Style.borderColor
        tableView.allowsSelection = true
        tableView.backgroundColor = Style.grayLight
        tableView.estimatedRowHeight = tableView.frame.height
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    private func registerCells() {
        tableView.register(PostExcerptCell.self, forCellReuseIdentifier: PostExcerptCell.kReuseIdentifier)
        tableView.register(PostsLoadingFooterView.self, forHeaderFooterViewReuseIdentifier: PostsLoadingFooterView.kReuseIdentifier)
    }
    
}

extension ArchiveViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.cell(forIndexPath: indexPath) ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfPosts() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let post = viewModel?.post(forIndexPath: indexPath),
            let vm = viewModel?.postViewModel(forPost: post) else { return }
        let vc = PostViewController()
        vc.viewModel = vm
        navigationController?.show(vc, sender: self)
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let vm = viewModel else { return }
        if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height - 100)
        && !vm.allPostsLoaded {
            tableView.sectionFooterHeight = 40
            let offset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
            scrollView.setContentOffset(offset, animated: true)
            vm.nextPageOfPosts { [weak self] _ in self?.tableView.sectionFooterHeight = 0.0 }
        }
    }
}
