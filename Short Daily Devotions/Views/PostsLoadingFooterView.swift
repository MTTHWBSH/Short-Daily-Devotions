//
//  PostsLoadingFooterView.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/16/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PostsLoadingFooterView: UITableViewHeaderFooterView {
    
    static let kReuseIdentifier = "PostsLoadingFooterView"

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: PostsLoadingFooterView.kReuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let wrapper = UIView()
        wrapper.backgroundColor = Style.grayLight
        addSubview(wrapper)
        wrapper.autoPinEdgesToSuperviewEdges()
        addActivityIndicator(toView: wrapper)
    }
    
    private func addActivityIndicator(toView view: UIView) {
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        indicator.color = Style.blue
        view.addSubview(indicator)
        indicator.autoCenterInSuperview()
    }

}
