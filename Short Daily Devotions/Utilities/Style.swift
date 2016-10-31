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
    static var blue: UIColor { get { return UIColor(red: 33, green: 55, blue: 79, alpha: 1) } }
    static var green: UIColor { get { return UIColor(red: 167, green: 167, blue: 69, alpha: 1) } }
    static var grayLight: UIColor { get { return UIColor(red: 252, green: 252, blue: 252, alpha: 1) } }
    static var gray: UIColor { get { return UIColor(red: 107, green: 107, blue: 107, alpha: 1) } }
    static var white: UIColor { get { return UIColor(red: 255, green: 255, blue: 255, alpha: 1) } }
    static var black: UIColor { get { return UIColor(red: 0, green: 0, blue: 0, alpha: 1) } }
    
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
        
    }
    
}
