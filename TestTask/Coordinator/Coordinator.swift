//
//  Coordinator.swift
//  TestTask
//
//  Created by Yaroslav Himko on 23.03.21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
