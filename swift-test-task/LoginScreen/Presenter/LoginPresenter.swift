//
//  LoginViewModel.swift
//  swift-test-task
//
//  Created by Dmitry on 09.06.2021.
//

import Foundation

protocol LoginPresenterProtocol {
    init(view: LoginViewProtocol, coordinator: Coordinator, networkService: NetworkServiceProtocol)
    func onLoginTap()
}

class LoginPresenter: LoginPresenterProtocol {
    
    private unowned var view: LoginViewProtocol
    private var coordinator: Coordinator
    private var networkService: NetworkServiceProtocol
    
    required init(view: LoginViewProtocol, coordinator: Coordinator, networkService: NetworkServiceProtocol) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.view = view
    }
    
    func onLoginTap() {
        view.showActivity()
        if view.loginValue?.count ?? 0 > 1 && view.passwordValue?.count ?? 0 > 1 {
            networkService.login(login: view.loginValue!, password: view.passwordValue!) { [unowned self] in
                view.hideActivity()
                self.coordinator.goMainScreen()
            }
        } else {
            view.showValidationAlert(with: "Oops!", and: "Login or password is empty!")
        }
    }
}
