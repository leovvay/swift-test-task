//
//  NetworkErrors.swift
//  swift-test-task
//
//  Created by Dmitry on 18.06.2021.
//

import Foundation

enum NetworkErrors {
    case SomeNetworkError
}

extension NetworkErrors: LocalizedError {
    var errorDescription: String?{
        switch self {
        case .SomeNetworkError:
            return "Something went wrong. Please, try again."
        }
    }
}
