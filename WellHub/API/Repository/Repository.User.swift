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
            case getUser(login: String)
            case getUserReposByPage(login: String, page: Int)

            var path: String {
                switch self {
                case .getUsersByPage(let lastId):
                    return "/users?per_page=\(APIHost.itemsPerPage)&since=\(lastId)"
                case .getUser(let login):
                    return "/users/\(login)"
                case .getUserReposByPage(let login, let page):
                    return "/users/\(login)/repos?per_page=\(APIHost.itemsPerPage)&page=\(page)"
                }
            }

            var method: Method {
                switch self {
                case .getUsersByPage, .getUser, .getUserReposByPage:
                    return .get
                }
            }

            var task: Task {
                switch self {
                case .getUsersByPage, .getUser, .getUserReposByPage:
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
    
    func getUser(login: String, completion: @escaping Completion) {
        provider.request(.getUser(login: login), completion: completion)
    }
    
    func getUserReposByPage(login: String, page: Int, completion: @escaping Completion) {
        provider.request(.getUserReposByPage(login: login, page: page), completion: completion)
    }
}
