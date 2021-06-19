import Alamofire

class Network {
    private static let loginUrl = "google.com"
    
    // This is fake request, it will always success
    static func logIn(login: String, password: String, _ completion: @escaping (String?) -> ()) {
        AF.request(loginUrl, method: .post, parameters: ["login": login, "password": password]).response {
            response in
            switch response.result {
            case .success(_):
                completion(nil)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
