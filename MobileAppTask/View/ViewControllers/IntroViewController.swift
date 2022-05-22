//
//  ViewController.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 20/04/2022.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var segmentControl: HBSegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSegmentControl()
      
    }
    
    func setUpSegmentControl(){
        segmentControl.items = ["Sign Up", "Log In"]
        segmentControl.font = UIFont(name: "Avenir-Black", size: 15)
        segmentControl.borderColor = UIColor(white: 1.1, alpha: 0.3)
        segmentControl.selectedIndex = 0
        segmentControl.addTarget(self, action: #selector(navigate), for: .valueChanged)
    }
    
    @objc func navigate(){
        
        if segmentControl.selectedIndex == 1 {
            let signIn = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            self.present(signIn, animated: true, completion: nil)
        }

       
    }


}

