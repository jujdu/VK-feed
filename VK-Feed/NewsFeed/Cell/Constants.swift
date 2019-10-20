//
//  Constants.swift
//  VK-Feed
//
//  Created by Michael Sidoruk on 20.10.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0,
                                         left: 8,
                                         bottom: 12,
                                         right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8,
                                              left: 8,
                                              bottom: 8,
                                              right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let maxAttachmentHeight: CGFloat = 500
    
    static let bottomViewHeight: CGFloat = 44
    static let bottomViewViewsHeight: CGFloat = 44
    static let bottomViewViewsWidth: CGFloat = 80
    
    static let bottomViewViewsIconSize: CGFloat = 24

}
