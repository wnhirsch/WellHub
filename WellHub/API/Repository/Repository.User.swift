//
//  Repository.User.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Moya

extension Repository {
    
    struct User {

        enum Target: APITarget {
            case getUsersByPage(lastId: Int)

            var path: String {
                switch self {
                case .getUsersByPage(let lastId):
                    return "/users?per_page=30&since=\(lastId)"
                }
            }

            var method: Method {
                switch self {
                case .getUsersByPage:
                    return .get
                }
            }

            var task: Task {
                switch self {
                case .getUsersByPage:
                    return .requestPlain
                }
            }

            var headers: [String: String]? {
               return sessionHeader()
            }
        }

        private let provider: MoyaProvider<Target> = APIProvider<Target>().build()
    }
    
}

extension Repository.User {

    func getUsersByPage(lastId: Int, completion: @escaping Completion) {
        provider.request(.getUsersByPage(lastId: lastId), completion: completion)
    }
}
