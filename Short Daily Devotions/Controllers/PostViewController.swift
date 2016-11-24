//
//  PostViewController.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 11/22/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PostViewController: UITableViewController {
    
    var viewModel: PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.render = { [weak self] in self?.render() }
        setupTableView()
    }
    
    private func render() {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
    }
    
}

extension PostViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.cell(forPostSection: indexPath) ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.postSections() ?? 0
    }
}
