//
//  NavigationController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 10/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    private func styleView() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = Style.white
        navigationBar.tintColor = Style.blue
        navigationBar.isTranslucent = false
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: Style.blue, NSFontAttributeName: Style.lightFont(withSize: 18.0)]
        navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        navigationBar.backIndicatorImage = UIImage(named: "Back")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "Back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
}
