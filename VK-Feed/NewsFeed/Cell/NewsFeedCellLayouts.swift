//
//  NewsFeedCellLayouts.swift
//  VK-Feed
//
//  Created by Michael Sidoruk on 19.10.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

protocol FeedCellLayoutsProtocol {
    func sizes(postText: String?, attachment: FeedCellPhotoAttachmentViewModel?, isFullSizedPost: Bool) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var moreTextButtonFrame: CGRect
    var attachmentFrame: CGRect
    var bottomViewFrame: CGRect
    var totalHeight: CGFloat
}

final class FeedCellLayouts: FeedCellLayoutsProtocol {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = UIScreen.main.bounds.width) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, attachment: FeedCellPhotoAttachmentViewModel?, isFullSizedPost: Bool) -> FeedCellSizes {
        
        var showMoreTextButton = false
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        // MARK: - Working with postLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left,
                                                    y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            var height = text.height(width: width, font: Constants.postLabelFont)
            let limitHeight = Constants.postLabelFont.lineHeight * Constants.minPostLimitLines
            
            if !isFullSizedPost && height > limitHeight {
                height = Constants.postLabelFont.lineHeight * Constants.minPostLines
                showMoreTextButton = true
            }
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: - Working with moreTextButtomFrame
        var moreTextButtonSize = CGSize.zero
        if showMoreTextButton == true {
            moreTextButtonSize = Constants.moreTextButtonSize
        }
        let moreTextButtonOrigin = CGPoint(x: Constants.moreTextButtonInsets.left, y: postLabelFrame.maxY)
        let moreTextButtonFrame = CGRect(origin: moreTextButtonOrigin, size: moreTextButtonSize)
        
        // MARK: - Working with attachmentFrame
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : moreTextButtonFrame.maxY + Constants.postLabelInsets.bottom
        var attachmentFrame = CGRect(origin: CGPoint(x: 0,
                                                     y: attachmentTop),
                                     size: CGSize.zero)
        if let attachment = attachment {
            let photoWidth: CGFloat = CGFloat(attachment.width)
            let photoHeight: CGFloat = CGFloat(attachment.height)
            let ration = photoHeight / photoWidth
            
            let height = cardViewWidth * ration
            if height < Constants.maxAttachmentHeight {
                attachmentFrame.size = CGSize(width: cardViewWidth, height: height)
            } else {
                attachmentFrame.size = CGSize(width: cardViewWidth, height: Constants.maxAttachmentHeight)
            }
        }
        // MARK: - Working with bottomViewTop
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        
        let bottomViewFrame = CGRect(origin: CGPoint(x: 0,
                                                     y: bottomViewTop),
                                     size: CGSize(width: cardViewWidth,
                                                  height: Constants.bottomViewHeight))
        
        // MARK: - Working with totalHeight
        let totalHeight = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        return Sizes.init(postLabelFrame: postLabelFrame,
                          moreTextButtonFrame: moreTextButtonFrame,
                          attachmentFrame: attachmentFrame,
                          bottomViewFrame: bottomViewFrame,
                          totalHeight: totalHeight)
    }
}
