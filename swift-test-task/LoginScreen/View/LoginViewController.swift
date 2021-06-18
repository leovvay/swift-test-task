//
//  ViewController.swift
//  swift-test-task
//
//  Created by Dmitry on 09.06.2021.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    var loginValue: String? { get }
    var passwordValue: String? { get }
    
    func showActivity()
    func hideActivity()
    func showLoginAlert(with title: String?, and text: String)
}

class LoginViewController: UIViewController, StoryboardInit {
    
    var presenter: LoginPresenterProtocol!
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func onLoginTap(_ sender: UIButton) {
        presenter.onLoginTap()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: LoginViewProtocol {
    func showActivity() {
        self.showActivityIndicator()
    }
    
    func hideActivity() {
        self.hideActivityIndicator()
    }
    
    var loginValue: String? {
        return login.text
    }
    
    var passwordValue: String? {
        return password.text
    }
    
    func showLoginAlert(with title: String?, and text: String) {
        self.showAlert(with: title, and: text)
    }
}
