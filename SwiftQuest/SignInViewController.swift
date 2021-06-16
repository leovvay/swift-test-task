//
//  ViewController.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 15.06.2021.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    @IBAction func loginTextFieldChanged(_ sender: UITextField) {
        acceptButton.isHidden = acceptButtonHidden()
    }
    
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        acceptButton.isHidden = acceptButtonHidden()
    }
    
    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        // We can safely force unwrap here, because these fields checked in acceptButtonHidden method
        Network.logIn(login: loginTextField.text!, password: passwordTextField.text!) {
            error in
            if let error = error {
                self.alertView(message: "Failed to login " + error)
            }
            else {
                let viewController = R.storyboard.main.mainViewController()!
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }
    
    private func acceptButtonHidden() -> Bool {
        if loginTextField.isEmpty || passwordTextField.isEmpty {
            errorLabel.text = "Error. Fill all fields."
            return true
        }
        if !loginTextField.hasValidEmail {
            errorLabel.text = "Error. Invalid email."
            return true
        }
        errorLabel.text = ""
        return false
    }
}

