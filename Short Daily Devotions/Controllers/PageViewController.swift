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
        viewModel.render = { [weak self] _ in self?.removeActivityIndicator();
                                              self?.setTitle();
                                              self?.addTextView() }
        setupView()
    }
    
    private func setTitle() { title = viewModel.titleForPage() }
    
    private func setupView() {
        title = viewModel.titleForPage()
        addTextView()
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
        textView.text = viewModel.pageContent()
        view.addSubview(textView)
        view.autoPinEdge(.top, to: .top, of: view, withOffset: 20)
        view.autoPinEdge(.leading, to: .leading, of: view, withOffset: 20)
        view.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: 20)
        view.autoPinEdge(.bottom, to: .bottom, of: view, withOffset: 0)
    }

}
