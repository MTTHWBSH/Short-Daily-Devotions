//
//  Style.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 10/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit

struct Style {
    
    // MARK: Colors
    static let blue = UIColor(red: 33/255, green: 55/255, blue: 79/255, alpha: 1)
    static let green = UIColor(red: 167/255, green: 167/255, blue: 69/255, alpha: 1)
    static let grayLight = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
    static let gray = UIColor(red: 107/255, green: 107/255, blue: 107/255, alpha: 1)
    static var white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static var black = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    
    // MARK: Fonts
    
    static func regularFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kRegularFontName, size: size)!
    }
    
    static func lightFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kLightFontName, size: size)!
    }
    
    static func lightItalic(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kLightItalicFontName, size: size)!
    }
    
    static func boldFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kBoldFontName, size: size)!
    }
    
    // MARK: Theme UI
    
    static func themeUI() {
        themeUINavigationBar()
        themeUISegmentedControl()
    }
    
    static private func themeUINavigationBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = Style.white
        UINavigationBar.appearance().tintColor = Style.blue
        UINavigationBar.appearance().isTranslucent = false
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: Style.blue, NSFontAttributeName: Style.lightFont(withSize: 18.0)]
        UINavigationBar.appearance().titleTextAttributes = titleDict as? [String : AnyObject]
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "Back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "Back")
    }
    
    static private func themeUISegmentedControl() {
        let attr = NSDictionary(object: Style.lightFont(withSize: 14.0), forKey: NSFontAttributeName as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
    }
    
}
