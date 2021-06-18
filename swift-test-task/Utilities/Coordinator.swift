//
//  Coordinator.swift
//  swift-test-task
//
//  Created by Dmitry on 10.06.2021.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    init(navigationController: UINavigationController, networkService: NetworkServiceProtocol)
    func start()
    func goMainScreen()
}

class Coordinator: CoordinatorProtocol {
    
    private var nav: UINavigationController
    private var networkService: NetworkServiceProtocol
    
    required init(navigationController: UINavigationController, networkService: NetworkServiceProtocol) {
        self.nav = navigationController
        self.networkService = networkService
    }
    
    func start() {
        let loginViewController = LoginViewController.instantiate()
        let loginPrecenter = LoginPresenter(view: loginViewController, coordinator: self, networkService: networkService)
        loginViewController.presenter = loginPrecenter
        nav.setViewControllers([loginViewController], animated: false)
    }
    
    func goMainScreen() {
        let collectionViewController = CollectionViewController.instantiate()
        let collectionPresenter = CollectionPresenter(view: collectionViewController, networkService: networkService)
        collectionViewController.presenter = collectionPresenter
        nav.pushViewController(collectionViewController, animated: true)
    }
}
