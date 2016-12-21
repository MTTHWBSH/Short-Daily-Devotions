//
//  MoreInfoViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/1/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class MoreInfoViewController: UITableViewController {
    
    var footerView = { return SocialMediaFooterView() }()
    var viewModel: MoreInfoViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func render() { tableView.reloadData() }

    private func setupView() {
        viewModel?.render = { [weak self] in self?.render() }
        title = "Info"
        view.backgroundColor = Style.grayLight
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

extension MoreInfoViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.cell(forIndexPath: indexPath) ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfOptions() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

/*
Button:  https://www.aplos.com/aws/give/short_daily_devotions/general
*/
