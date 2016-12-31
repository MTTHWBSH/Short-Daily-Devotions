//
//  SupportViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class SupportViewController: UIViewController {

    var viewModel: SupportViewModel
    
    let contentLabel = UILabel()
    let addressLabel = UILabel()
    
    init(viewModel: SupportViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = viewModel.title()
        view.backgroundColor = Style.grayLight
        addContent()
        addAddress()
        addDonationButton()
    }
    
    private func addContent() {
        let content = viewModel.content()
        let attrString = NSMutableAttributedString(string: content)
        let pgStyle = NSMutableParagraphStyle()
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        pgStyle.lineSpacing = 3
        pgStyle.paragraphSpacing = 12
        
        let attrs: [String: Any] = [
            NSParagraphStyleAttributeName: pgStyle,
            NSFontAttributeName: Style.lightFont(withSize: 16)
        ]
        attrString.addAttributes(attrs, range: NSMakeRange(0, content.characters.count))
        contentLabel.attributedText = attrString
        
        view.addSubview(contentLabel)
        contentLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12), excludingEdge: .bottom)
    }
    
    private func addAddress() {
        addressLabel.text = viewModel.address()
        addressLabel.numberOfLines = 0
        addressLabel.font = Style.boldFont(withSize: 16)
        addressLabel.textColor = Style.black
        view.addSubview(addressLabel)
        addressLabel.autoPinEdge(.top, to: .bottom, of: contentLabel)
        addressLabel.autoPinEdge(.leading, to: .leading, of: contentLabel)
        addressLabel.autoPinEdge(.trailing, to: .trailing, of: contentLabel)
    }
    
    private func addDonationButton() {
        let button = UIButton()
        button.setTitle("Donate", for: .normal)
        button.setTitleColor(Style.grayLight, for: .normal)
        button.titleLabel?.font = Style.boldFont(withSize: 20)
        button.backgroundColor = Style.pink
        button.addTarget(self, action: #selector(openDonationLink), for: .touchUpInside)
        view.addSubview(button)
        button.autoSetDimension(.height, toSize: 50)
        button.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 12, bottom: 12, right: 12), excludingEdge: .top)
    }
    
    @objc private func openDonationLink() {
        guard let url = viewModel.donationLink() else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
