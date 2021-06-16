//
//  MoyaNetworkService.swift
//  swift-test-task
//
//  Created by Dmitry on 10.06.2021.
//

import Foundation
import Moya

enum Service {
    case login(login: String, password: String)
    case getImages
}

extension Service: TargetType {
    var baseURL: URL { URL(string: "https://loremflickr.com")! }
    
    var path: String {
        switch self {
        case .login:
            return ""
        case .getImages:
            return "/500/500"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .getImages:
            return .get
        }
    }
    
    var sampleData: Data { return Data() }
    
    var task: Task {
        switch self {
        case .login(let login, let password):
            return .requestParameters(parameters: [
                                        "login": login,
                                        "pass": password,
            ],encoding: URLEncoding.httpBody)
        case .getImages:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
}

class MoyaNetworkService: NetworkServiceProtocol {

    private var provider: MoyaProvider<Service>
    
    init() {
        provider = MoyaProvider<Service>()
    }
    
    func login(login: String, password: String, handler: @escaping () -> ()) {
        provider.request(.login(login: login, password: password)) { result in
            DispatchQueue.main.async {
                switch result {
                
                case .success(_):
                    handler()
                    
                case .failure(let error):
                    print(error.errorDescription ?? "")
                }
            }
        }
    }
    
    func getImage(handler: @escaping (Data) -> ()) {
        provider.request(.getImages) { result in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let response):
                    handler(response.data)
                case .failure(let error):
                    print(error.errorDescription ?? "")
                }
            }
        }
    }
}
