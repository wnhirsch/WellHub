//
//  User.List.ViewModel.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Foundation

extension Scene.User.List {
    
    class ViewModel {
        
        private let coordinator: Coordinator.User
        private let worker: Worker.User
        var users: [Model.User] = []
        var lastId: Int = 0

        init(coordinator: Coordinator.User, worker: Worker.User = .init()) {
            self.coordinator = coordinator
            self.worker = worker
        }
        
        func fetchUsers() {
            // TODO: start loading
            
            worker.getUsersByPage(lastId: lastId, success: { [weak self] users in
                guard let self = self else { return }
                self.users = users
                // TODO: alert success
            }, failure: { [weak self] in
                guard let self = self else { return }
                // TODO: alert error
            })
        }
    }
}
