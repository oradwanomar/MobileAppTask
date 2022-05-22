//
//  Extension.swift
//  MobileAppTask
//
//  Created by Omar Ahmed on 20/04/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertError(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

}

extension UIViewController {
    func animateButton(button:UIButton){
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
                       options: [], animations: {
                        button.transform =
                           CGAffineTransform(scaleX: 2.0, y: 2.0)
                        button.transform =
                           CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }, completion: nil)
    }
}
