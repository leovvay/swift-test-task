//
//  SceneDelegate.swift
//  swift-test-task
//
//  Created by Dmitry on 09.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: CoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        let navController = UINavigationController()
        let networkService = MoyaNetworkService()
        
        appCoordinator = Coordinator(navigationController: navController, networkService: networkService)
        appCoordinator?.start()
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

