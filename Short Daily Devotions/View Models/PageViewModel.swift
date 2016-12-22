//
//  PageViewModel.swift
//  Short Daily Devotions
//
//  Created by Matthew Bush on 12/21/16.
//  Copyright © 2016 Matt Bush. All rights reserved.
//

import Alamofire

enum PageTitle: String {
    case about = "About", beliefs = "Beliefs"
}

class PageViewModel: ViewModel {
    
    private var pageTitle: String
    
    init(pageTitle: String) {
        self.pageTitle = pageTitle
        super.init()
    }
    
    private func loadPosts(pageID: String, completion: ((Void) -> Void)?) {
        Alamofire.request(Constants.kPageBaseURL + pageID)
            .responseJSON { [weak self] response in
                guard let data = response.data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []),
                    let posts = json as? NSArray else { return }
                completion?()
        }
    }
    
    func titleForPage() -> String { return pageTitle }
    
}
