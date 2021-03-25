//
//  DefaultAlamofireManager.swift
//  TestTask
//
//  Created by Yaroslav Himko on 25.03.21.
//

import Foundation
import Alamofire

class DefaultAlamofireManager: Alamofire.Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 2 // request timeout for faster feedback
        return DefaultAlamofireManager(configuration: configuration)
    }()
}
