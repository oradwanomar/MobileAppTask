//
//  LogInViewController.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 20/04/2022.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        animateButton(button: signInButton)
    }
    
}
