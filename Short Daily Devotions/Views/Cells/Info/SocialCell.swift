//
//  SocialCell.swift
//  Short Daily Devotions
//
//  Created by Matt Bush on 12/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class SocialCell: UITableViewCell {
    
    var viewModel: MoreInfoViewModel
    
    static let kReuseIdentifier = "SocialCell"
    let kButtonHeight: CGFloat = 60
    let wrapperView = UIView()

    init(viewModel: MoreInfoViewModel) {
        self.viewModel = viewModel
        super.init(style: .default, reuseIdentifier: SocialCell.kReuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Style.grayLight
        selectionStyle = .none
        setupWrapperView()
        addSocialButtons()
    }
    
    private func setupWrapperView() {
        addSubview(wrapperView)
        wrapperView.autoSetDimension(.width, toSize: 240)
        wrapperView.autoSetDimension(.height, toSize: kButtonHeight)
        wrapperView.autoCenterInSuperview()
    }
    
    private func addSocialButtons() {
        addFacebookButton()
        addTwitterButton()
        addInstagramButton()
    }
    
    private func addFacebookButton() {
        guard let url = viewModel.kFacebookURL else { return }
        let button = socialButton(withImage: #imageLiteral(resourceName: "Facebook"), url: url)
        wrapperView.addSubview(button)
        button.autoSetDimension(.height, toSize: kButtonHeight)
        button.autoSetDimension(.width, toSize: kButtonHeight)
        button.autoAlignAxis(.horizontal, toSameAxisOf: wrapperView)
        button.autoPinEdge(.leading, to: .leading, of: wrapperView)
        makeCircle(forButton: button)
        button.addTarget(self, action: #selector(openFacebookURL), for: .touchUpInside)
    }
    
    private func addTwitterButton() {
        guard let url = viewModel.kTwitterURL else { return }
        let button = socialButton(withImage: #imageLiteral(resourceName: "Twitter"), url: url)
        wrapperView.addSubview(button)
        button.autoSetDimension(.height, toSize: kButtonHeight)
        button.autoSetDimension(.width, toSize: kButtonHeight)
        button.autoCenterInSuperview()
        makeCircle(forButton: button)
        button.addTarget(self, action: #selector(openTwitterURL), for: .touchUpInside)
    }
    
    private func addInstagramButton() {
        guard let url = viewModel.kInstagramURL else { return }
        let button = socialButton(withImage: #imageLiteral(resourceName: "Instagram"), url: url)
        wrapperView.addSubview(button)
        button.autoSetDimension(.height, toSize: kButtonHeight)
        button.autoSetDimension(.width, toSize: kButtonHeight)
        button.autoAlignAxis(.horizontal, toSameAxisOf: wrapperView)
        button.autoPinEdge(.trailing, to: .trailing, of: wrapperView)
        makeCircle(forButton: button)
        button.addTarget(self, action: #selector(openInstagramURL), for: .touchUpInside)
    }
    
    private func socialButton(withImage image: UIImage, url: URL) -> UIButton {
        let button = UIButton()
        button.backgroundColor = Style.pink
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        return button
    }
    
    private func makeCircle(forButton button: UIButton) {
        button.layer.cornerRadius = ceil(kButtonHeight / 2.0)
        button.layer.rasterizationScale = UIScreen.main.scale
        button.layer.shouldRasterize = true
    }
    
    @objc private func openFacebookURL() { guard let url = viewModel.kFacebookURL else { return }; UIApplication.shared.open(url, options: [:], completionHandler: nil) }
    @objc private func openTwitterURL() { guard let url = viewModel.kTwitterURL else { return }; UIApplication.shared.open(url, options: [:], completionHandler: nil) }
    @objc private func openInstagramURL() { guard let url = viewModel.kInstagramURL else { return }; UIApplication.shared.open(url, options: [:], completionHandler: nil) }

}
