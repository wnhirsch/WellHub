//
//  Worker.User.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

extension Worker {
    
    class User {
        
        private let api: Repository.User
        
        init(api: Repository.User = .init()) {
            self.api = api
        }
        
        func getUsersByPage(lastId: Int = 0, success: (([Model.User]) -> Void)? = nil, failure: (() -> Void)? = nil) {
            api.getUsersByPage(lastId: lastId) { result in
                switch result {
                case let .success(response):
                    do {
                        let users = try response.mapObject([Model.User].self)
                        success?(users)
                    } catch let error {
                        print(error)
                        failure?()
                    }
                case let .failure(error):
                    print(error)
                    failure?()
                }
            }
        }
        
        func getUser(login: String, success: ((Model.UserDetail) -> Void)? = nil, failure: (() -> Void)? = nil) {
            api.getUser(login: login) { result in
                switch result {
                case let .success(response):
                    do {
                        let user = try response.mapObject(Model.UserDetail.self)
                        success?(user)
                    } catch let error {
                        print(error)
                        failure?()
                    }
                case let .failure(error):
                    print(error)
                    failure?()
                }
            }
        }
        
        func getUserReposByPage(login: String, page: Int = 1, success: (([Model.Repository]) -> Void)? = nil, failure: (() -> Void)? = nil) {
            api.getUserReposByPage(login: login, page: page) { result in
                switch result {
                case let .success(response):
                    do {
                        let repositories = try response.mapObject([Model.Repository].self)
                        success?(repositories)
                    } catch let error {
                        print(error)
                        failure?()
                    }
                case let .failure(error):
                    print(error)
                    failure?()
                }
            }
        }
    }
}
