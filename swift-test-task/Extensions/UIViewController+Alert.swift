//
//  UIViewController+Alert.swift
//  swift-test-task
//
//  Created by Dmitry on 15.06.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(with title: String?, and text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
