//
//  ViewController.swift
//  TestTask
//
//  Created by Yaroslav Himko on 23.03.21.
//

import UIKit
import Moya
import RxSwift

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        acceptButton.addTarget(self,
                              action: #selector(didTapAcceptButton),
                              for: .touchUpInside)
        
        addSubviews()
        
        view.backgroundColor = .systemBackground
    }

    //MARK: - Creating fields and buttons
    
    private let loginField: UITextField = {
        let field = UITextField()
        field.placeholder = "Logn"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let acceptButton: UIButton = {
        let button = UIButton()
        button.setTitle("Accept", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    //MARK: - Layout fields and buttons
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Assign frames
        loginField.frame = CGRect(
            x: 25,
            y: (view.height/3.0) + 40,
            width: view.width - 50,
            height: 52.0
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: loginField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
        
        acceptButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52.0
        )
    }
    
    private func addSubviews(){
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(acceptButton)
    }
    
    @objc private func didTapAcceptButton() {
        passwordField.resignFirstResponder()
        loginField.resignFirstResponder()
        
        NetworkManager.shared.executeRequest()
            .subscribe(onCompleted: {
                self.coordinator?.login()
            }, onError: { error in
                self.showError(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Log In Error", message: "We we unable to log you in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
