//
//  NetworkService.swift
//  TestTask
//
//  Created by Yaroslav Himko on 23.03.21.
//

import Foundation
import Moya

enum NetworkService {
    case getGoogle
}

extension NetworkService: TargetType {
    var path: String {
        return Constants.RelativePath
    }
    
    var sampleData: Data {
        switch self {
        case .getGoogle:
            return Data()
        }
    }
    
    var headers: [String : String]? {
        return Constants.ContentType
    }
    
    var baseURL: URL {
        return URL(string: Constants.BaseURL)!
    }
    
    var method: Moya.Method {
        switch self {
        case .getGoogle:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getGoogle:
            return .requestPlain
        }
    }
}

