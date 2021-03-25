//
//  HomeViewController.swift
//  TestTask
//
//  Created by Yaroslav Himko on 23.03.21.
//

import UIKit
import Moya

class HomeViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
    }
}
