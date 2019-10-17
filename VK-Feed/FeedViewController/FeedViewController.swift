//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Алексей Пархоменко on 23/02/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkServie = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        networkServie.request(path: API.newsFeed, params: ["filters" :"post"]) { (data, error) in
            
        }
        view.backgroundColor = #colorLiteral(red: 0.5671284795, green: 0.7945078611, blue: 0.9987251163, alpha: 1)
        // Do any additional setup after loading the view.
    }
}
