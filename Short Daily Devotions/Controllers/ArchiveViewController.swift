//
//  ArchiveViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 11/22/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class ArchiveViewController: UITableViewController {
    
    var footerView = { return PostsLoadingFooterView() }()
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
        tableView.tableFooterView = footerView
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Style.borderColor
        tableView.allowsSelection = true
        tableView.backgroundColor = Style.grayLight
        tableView.estimatedRowHeight = tableView.frame.height
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    private func registerCells() {
        tableView.register(PostExcerptCell.self, forCellReuseIdentifier: PostExcerptCell.kReuseIdentifier)
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

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let vm = viewModel else { return }
        if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height)
        && !vm.allPostsLoaded {
            tableView.tableFooterView?.isHidden = false
            vm.nextPageOfPosts { [weak self] _ in self?.tableView.tableFooterView?.isHidden = true }
        }
    }
}
