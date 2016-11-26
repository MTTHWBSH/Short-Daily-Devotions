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
        registerCells()
        tableView.separatorStyle = .none
    }
    
    private func registerCells() {
        tableView.register(PostDetailsCell.self, forCellReuseIdentifier: PostDetailsCell.kReuseIdentifier)
        tableView.register(PostContentCell.self, forCellReuseIdentifier: PostContentCell.kReuseIdentifier)
    }
    
}

extension PostViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.cell(forIndexPath: indexPath) ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.postSections() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
