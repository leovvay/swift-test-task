//
//  ViewController.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 15.06.2021.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        acceptButton.isHidden = true
    }
    
    private func acceptButtonHidden() -> Bool {
        if loginTextField.isEmpty || passwordTextField.isEmpty {
            errorLabel.isHidden = false
            errorLabel.text = "Error. Fill all fields."
            return true
        }
        if !loginTextField.hasValidEmail {
            errorLabel.isHidden = false
            errorLabel.text = "Error. Invalid email."
            return true
        }
        if !passwordTextField.hasValidPaswword {
            errorLabel.isHidden = false
            errorLabel.text = "Error. Password is too short. Must be at least 6 symbols."
            return true
        }
        errorLabel.text = ""
        return false
    }
}

//MARK: - IBActions
extension SignInViewController {
    @IBAction func loginTextFieldChanged(_ sender: UITextField) {
        acceptButton.isHidden = acceptButtonHidden()
    }
    
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        acceptButton.isHidden = acceptButtonHidden()
    }
    
    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        ProgressHUD.show()
        // We can safely force unwrap here, because these fields checked in acceptButtonHidden method
        Network.logIn(login: loginTextField.text!, password: passwordTextField.text!) { error in
            ProgressHUD.dismiss()
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
}
