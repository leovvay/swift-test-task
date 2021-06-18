//
//  NetworkProtocol.swift
//  swift-test-task
//
//  Created by Dmitry on 10.06.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func login(login: String, password: String, handler: @escaping (Result<Void, Error>) -> ())
    func getImage(handler: @escaping (Result<Data, Error>) -> ())
}
