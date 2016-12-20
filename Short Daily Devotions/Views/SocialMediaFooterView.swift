//
//  SocialMediaFooterView.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/20/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class SocialMediaFooterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let wrapper = UIView()
        wrapper.backgroundColor = Style.green
        addSubview(wrapper)
        wrapper.autoPinEdgesToSuperviewEdges()
        addSocialButtons(toView: wrapper)
    }
    
    private func addSocialButtons(toView view: UIView) {

    }

}
