//
//  PageViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Alamofire

class PageViewModel: ViewModel {
    
    private var pageID: String
    private var page: Post? { didSet { render?() } }
    
    init(pageID: String) {
        self.pageID = pageID
        super.init()
        loadPage(id: pageID, completion: nil)
    }
    
    private func loadPage(id: String, completion: ((Void) -> Void)?) {
        Alamofire.request(Constants.kPageBaseURL + pageID)
            .responseJSON { [weak self] response in
                guard let data = response.data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []),
                    let dict = json as? NSDictionary,
                    let page = Post.from(dict) else { return }
                self?.page = page
                completion?()
        }
    }
    
    func titleForPage() -> String { return page?.title ?? "" }
    
    func pageContent() -> String { return page?.content ?? "" }
    
}
