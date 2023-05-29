//
//  User.Detail.ViewModel.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 23/05/23.
//

import RxSwift
import RxRelay

extension Scene.User.Detail {
    
    class ViewModel {
        
        private let login: String
        private let coordinator: Coordinator.User
        private let worker: Worker.User
        
        private var actualPage: Int = 1
        private var maxPage: Int = 1
        let userDetail = PublishSubject<Model.UserDetail>()
        let repos = BehaviorRelay<[Model.Repository]>(value: [])
        let isLoading = BehaviorRelay<Bool>(value: false)

        init(login: String, coordinator: Coordinator.User, worker: Worker.User = .init()) {
            self.login = login
            self.coordinator = coordinator
            self.worker = worker
        }
        
        func fetchUserDetail() {
            isLoading.accept(true)
            
            worker.getUser(login: login, success: { [weak self] userDetail in
                guard let self = self else { return }
                self.userDetail.onNext(userDetail)
                self.maxPage = computeMaxPages(items: userDetail.publicRepos ?? 0)
                self.isLoading.accept(false)
                self.fetchUserRepos()
            }, failure: { [weak self] in
                guard let self = self else { return }
                self.isLoading.accept(false)
                self.coordinator.showError { [weak self] _ in
                    guard let self = self else { return }
                    self.fetchUserDetail()
                }
            })
        }
        
        func fetchUserRepos() {
            guard actualPage <= maxPage else { return }
            isLoading.accept(true)
            
            worker.getUserReposByPage(login: login, page: actualPage, success: { [weak self] repos in
                guard let self = self else { return }
                self.repos.accept(self.repos.value + repos)
                self.actualPage += 1
                self.isLoading.accept(false)
            }, failure: { [weak self] in
                guard let self = self else { return }
                self.isLoading.accept(false)
                self.coordinator.showError { [weak self] _ in
                    guard let self = self else { return }
                    self.fetchUserDetail()
                }
            })
        }
        
        private func computeMaxPages(items: Int) -> Int {
            Int(ceil(Double(items) / Double(APIHost.itemsPerPage)))
        }
    }
}
