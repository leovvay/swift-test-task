//
//  NetworkManager.swift
//  TestTask
//
//  Created by Yaroslav Himko on 24.03.21.
//

import RxSwift
import Moya

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private let provider = MoyaProvider<NetworkService>(session: DefaultAlamofireManager.sharedManager)

    init() {}
    
    func executeRequest() -> Completable {
        return provider.rx
            .request(.getGoogle)
            .filterSuccessfulStatusAndRedirectCodes()
            .asObservable().ignoreElements()
    }
}
