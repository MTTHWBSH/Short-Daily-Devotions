//
//  ContactViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/30/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout
import MessageUI

class ContactViewController: UIViewController {

    var viewModel: ContactViewModel
    
    let addressLabel = UILabel()
    let emailButton = UIButton()
    
    init(viewModel: ContactViewModel) {
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
        addAddress()
        addEmailButton()
    }
    
    private func addAddress() {
        addressLabel.text = viewModel.address()
        addressLabel.numberOfLines = 0
        addressLabel.font = Style.boldFont(withSize: 16)
        addressLabel.textColor = Style.black
        addressLabel.textAlignment = .center
        view.addSubview(addressLabel)
        addressLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0), excludingEdge: .bottom)
    }
    
    private func addEmailButton() {
        emailButton.addTarget(self, action: #selector(openEmail), for: .touchUpInside)
        emailButton.setTitle(viewModel.emailAddress(), for: .normal)
        emailButton.setTitleColor(Style.pink, for: .normal)
        emailButton.titleLabel?.font = Style.boldFont(withSize: 16)
        emailButton.backgroundColor = UIColor.clear
        view.addSubview(emailButton)
        emailButton.autoPinEdge(.top, to: .bottom, of: addressLabel, withOffset: 30)
        emailButton.autoPinEdge(.leading, to: .leading, of: addressLabel)
        emailButton.autoPinEdge(.trailing, to: .trailing, of: view)
    }
    
    @objc private func openEmail () {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
        vc.setToRecipients([viewModel.emailAddress()])
        vc.setSubject("Short Daily Devotions")
        vc.setMessageBody("", isHTML: false)
        present(vc, animated: true, completion: nil)
    }

}

extension ContactViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
