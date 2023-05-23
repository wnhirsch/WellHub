//
//  User.List.ViewController.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import RxCocoa
import RxSwift
import UIKit

extension Scene.User.List {

    class ViewController: UIViewController, Loadable {

        private let mainView: View
        private let viewModel: ViewModel
        private let bag = DisposeBag()

        init(viewModel: ViewModel) {
            mainView = View()
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func loadView() {
            view = mainView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            bind()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        private func bind() {
            // Bind users from API with the table and show them
            viewModel.users.bind(
                to: mainView.tableView.rx.items(cellIdentifier: Cell.identifier, cellType: Cell.self)
            ) { _, model, cell in
                cell.setup(login: model.login, avatarUrl: model.avatarUrl)
            }.disposed(by: bag)
            
            // Bind the loading flag with UI feedback
            viewModel.isLoading.bind { [weak self] isLoading in
                guard let self = self else { return }
                isLoading ? self.showLoading() : self.hideLoading()
            }.disposed(by: bag)
            
            // Bind user click with action
            mainView.tableView.rx.modelSelected(Model.User.self).bind { user in
                // TODO:
            }.disposed(by: bag)
            
            // Subscribe an observable for the Table's content offset
            mainView.tableView.rx.contentOffset
                .debounce(.milliseconds(200), scheduler: MainScheduler.instance)
                .subscribe { [weak self] value in
                guard let self = self,
                      !self.viewModel.isLoading.value,
                      let contentOffset = value.element?.y else { return }
                // Verify if it did scroll to bottom and load more users if true
                let contentSize = self.mainView.tableView.contentSize.height
                let tableSize = self.mainView.tableView.frame.height
                if contentOffset > (contentSize - tableSize) {
                    self.viewModel.fetchUsers()
                }
            }.disposed(by: bag)
            
            // After bind everything, fetch the data
            viewModel.fetchUsers()
        }
    }
}
