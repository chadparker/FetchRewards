//
//  UIViewController+presentAlert.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/13/21.
//

import UIKit

extension UIViewController {
 
    func presentSimpleAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
