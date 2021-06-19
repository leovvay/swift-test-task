//
//  AppDelegate.swift
//  SwiftQuest
//
//  Created by Анастасия Гаранович on 15.06.2021.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        IQKeyboardManager.shared.enable = true
    }
}
