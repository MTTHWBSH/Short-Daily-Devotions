//
//  PageViewController.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import UIKit
import PureLayout

class PageViewController: UIViewController {
    
    var viewModel: PageViewModel
    var textView: UITextView?
    var activityIndicator: UIActivityIndicatorView?
    
    init(viewModel: PageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.render = { [weak self] _ in self?.removeActivityIndicator();
                                              self?.setTitle();
                                              self?.addTextView() }
    }
    
    private func setTitle() { title = viewModel.titleForPage() }
    
    private func setupView() {
        view.backgroundColor = Style.grayLight
        addActivityIndicator()
    }
    
    private func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        guard let indicator = activityIndicator else { return }
        indicator.startAnimating()
        indicator.color = Style.blue
        view.addSubview(indicator)
        indicator.autoCenterInSuperview()
    }
    
    private func removeActivityIndicator() {
        guard let indicator = activityIndicator else { return }
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
    
    private func addTextView() {
        textView = UITextView()
        guard let textView = textView else { return }
        
        let content = viewModel.pageContent()
        let attrString = NSMutableAttributedString(string: content)
        let pgStyle = NSMutableParagraphStyle()
        pgStyle.lineSpacing = 3
        pgStyle.paragraphSpacing = 12

        let attrs: [String: Any] = [
            NSParagraphStyleAttributeName: pgStyle,
            NSFontAttributeName: Style.lightFont(withSize: 16)
        ]
        attrString.addAttributes(attrs, range: NSMakeRange(0, content.characters.count))
        textView.attributedText = attrString
        layout(textView)
    }
    
    private func layout(_ textView: UITextView) {
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 8, bottom: 3, right: 8)
        view.addSubview(textView)
        textView.autoPinEdgesToSuperviewEdges()
    }

}
