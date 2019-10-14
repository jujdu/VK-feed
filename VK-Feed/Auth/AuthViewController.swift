//
//  AuthViewController.swift
//  VK-Feed
//
//  Created by Michael Sidoruk on 13.10.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authService = AppDelegate.shared().authService
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func signInPressed(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}
