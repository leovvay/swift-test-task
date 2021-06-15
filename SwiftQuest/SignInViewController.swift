//
//  ViewController.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 15.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func loginTextFieldChanged(_ sender: UITextField) {
        textFieldsCheck()
    }
    
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        textFieldsCheck()
    }
    
    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        //Network.logIn(login: loginTextField.text ?? "admin", password: passwordTextField.text ?? "admin", <#T##completion: (String?) -> ()##(String?) -> ()#>)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func textFieldsCheck() {
        if loginTextField.text == "" || passwordTextField.text == "" {
            errorLabel.isHidden = false
            errorLabel.text = "Enter login and password"
        }
    }
}

