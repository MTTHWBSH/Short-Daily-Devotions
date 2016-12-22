//
//  MoreInfoViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 11/1/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class MoreInfoViewController: UITableViewController {
    
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setupTableView()
    }
    
    private func setupTableView() {
        registerCells()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Style.borderColor
        tableView.allowsSelection = true
        tableView.backgroundColor = Style.grayLight
        tableView.estimatedRowHeight = tableView.frame.height
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    private func registerCells() {
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.kReuseIdentifier)
        tableView.register(SocialCell.self, forCellReuseIdentifier: SocialCell.kReuseIdentifier)
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
        return viewModel?.heightForRow(atIndexPath: indexPath) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = viewModel?.viewController(forIndexPath: indexPath) else { return }
        navigationController?.show(vc, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}
