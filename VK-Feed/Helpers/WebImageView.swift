//
//  WebImageView.swift
//  VK-Feed
//
//  Created by Michael Sidoruk on 18.10.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    func set(imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {
            self.image = nil
            return }
        
        if let chachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: chachedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let chachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(chachedResponse, for: URLRequest(url: responseUrl))
    }
}

