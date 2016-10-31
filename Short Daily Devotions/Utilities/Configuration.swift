//
//  Configuration.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 10/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class Configuration {

    static func setupServices(_ launchOptions: [AnyHashable: Any]?) {
        
    }

    static func run(_ window: UIWindow?) {
        Style.themeUI()
        let nc = NavigationController(rootViewController: PostsViewController(viewModel: PostsViewModel(postsURL: Constants.kAllPostsURL)))
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }

}
