//
//  User.Detail.ViewController.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 23/05/23.
//

import RxCocoa
import RxSwift
import UIKit

extension Scene.User.Detail {

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
            navigationItem.backBarButtonItem = .init()
            bind()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        
        private func bind() {
            // Bind user detail from API with the view and update it
            viewModel.userDetail.bind { [weak self] model in
                guard let self = self else { return }
                self.mainView.setup(model: model)
            }.disposed(by: bag)
            
            // Bind repositories from API with the view and update it
            viewModel.repos.bind(
                to: mainView.tableView.rx.items(cellIdentifier: Cell.identifier, cellType: Cell.self)
            ) { _, model, cell in
                cell.setup(model: model)
            }.disposed(by: bag)
            
            // Bind the loading flag with UI feedback
            viewModel.isLoading.bind { [weak self] isLoading in
                guard let self = self else { return }
                isLoading ? self.showLoading() : self.hideLoading()
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
                    self.viewModel.fetchUserRepos()
                }
            }.disposed(by: bag)
            
            // After bind everything, fetch the data
            viewModel.fetchUserDetail()
        }
    }
}
