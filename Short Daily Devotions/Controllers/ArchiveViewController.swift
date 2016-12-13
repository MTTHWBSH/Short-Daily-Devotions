//
//  ArchiveViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 11/22/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class ArchiveViewController: UITableViewController {
    
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
        tableView.separatorStyle = .none
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
}
