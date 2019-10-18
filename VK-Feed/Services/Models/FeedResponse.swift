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
    var profiles: [Profile]
    var groups: [Group]
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

protocol ProfileRepresentable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

struct Profile: Decodable, ProfileRepresentable {
    var id: Int
    var firstName: String
    var lastName: String
    var photo100: String
    
    var name: String { return firstName + " " + lastName }
    var photo: String { return photo100 }
}

struct Group: Decodable, ProfileRepresentable {
    var id: Int
    var name: String
    var photo100: String
    
    var photo: String { return photo100 }
}
