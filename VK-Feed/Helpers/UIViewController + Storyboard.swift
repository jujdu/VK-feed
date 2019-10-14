//
//  UIViewController + Storyboard.swift
//  VK-Feed
//
//  Created by Michael Sidoruk on 13.10.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

extension UIViewController {
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() as? T {
            return vc
        } else {
            fatalError("Error: No initial vc in \(name) storyboard")
        }
    }
}
