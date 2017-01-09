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
    
    let refreshEnabled: Bool
    var viewModel: PostViewModel?
    
    init(refreshEnabled: Bool) {
        self.refreshEnabled = refreshEnabled
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.render = { [weak self] in self?.render() }
        setupTableView()
        if refreshEnabled { setupRefreshControl() }
    }
    
    private func render() {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        registerCells()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = Style.grayLight
        tableView.estimatedRowHeight = tableView.frame.height
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = Style.blue
        refreshControl?.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        viewModel?.refreshPost(completion: { [weak self] _ in self?.refreshControl?.endRefreshing() })
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
}
