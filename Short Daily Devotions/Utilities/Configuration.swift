//
//  Configuration.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 10/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class Configuration {

    static func run(_ window: UIWindow?) {
        Style.themeUI()
        let nc = UINavigationController(rootViewController: PostsViewController(viewModel: PostsViewModel(postsURL: Constants.kAllPostsURL)))
        nc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }

}
