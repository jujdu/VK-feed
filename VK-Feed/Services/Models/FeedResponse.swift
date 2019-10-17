//
//  FeedResponse.swift
//  VK-Feed
//
//  Created by Michael Sidoruk on 18.10.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    var sourceId: Int
    let postId: Int
    var text: String?
    var date: Double
    var comments: CountableItem?
    var likes: CountableItem?
    var reposts: CountableItem?
    var views: CountableItem?
}


struct CountableItem: Decodable {
    let count: Int
}
