//
//  User.List.ViewModel.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import RxSwift
import RxRelay

extension Scene.User.List {
    
    class ViewModel {
        
        private let coordinator: Coordinator.User
        private let worker: Worker.User
        
        private var lastId: Int = 0
        let users = BehaviorRelay<[Model.User]>(value: [])
        let isLoading = BehaviorRelay<Bool>(value: false)

        init(coordinator: Coordinator.User, worker: Worker.User = .init()) {
            self.coordinator = coordinator
            self.worker = worker
        }
        
        func fetchUsers() {
            isLoading.accept(true)
            
            worker.getUsersByPage(lastId: lastId, success: { [weak self] users in
                guard let self = self else { return }
                if let lastId = users.last?.id {
                    self.lastId = lastId
                }
                self.users.accept(self.users.value + users)
                self.isLoading.accept(false)
            }, failure: { [weak self] in
                guard let self = self else { return }
                self.isLoading.accept(false)
                self.coordinator.showError { [weak self] _ in
                    guard let self = self else { return }
                    self.fetchUsers()
                }
            })
        }
    }
}
