//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Michael Sidoruk on 16/10/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ (feedItem) in
                print(feedItem.postId)
            })
        }
        view.backgroundColor = #colorLiteral(red: 0.5671284795, green: 0.7945078611, blue: 0.9987251163, alpha: 1)
        // Do any additional setup after loading the view.
    }
}
