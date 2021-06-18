//
//  UIViewController+StoryboardInit.swift
//  swift-test-task
//
//  Created by Dmitry on 10.06.2021.
//

import Foundation
import UIKit

protocol StoryboardInit {
    static func instantiate() -> Self
}

extension StoryboardInit where Self: UIViewController {
    static func instantiate() -> Self {
        let className = NSStringFromClass(self).components(separatedBy: ".").last!
        let storyboard = UIStoryboard(name: className, bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: className) as? Self
        guard let vc = view else {
            fatalError("Unable to init \(className)")
        }
        return vc
    }
}
