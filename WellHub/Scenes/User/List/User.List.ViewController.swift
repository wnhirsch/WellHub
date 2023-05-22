//
//  User.List.ViewController.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import UIKit

extension Scene.User.List {

    class ViewController: UIViewController, Loadable {

        private let mainView: View
        private let viewModel: ViewModel

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
            setupTableView()
            viewModel.fetchUsers()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        private func setupTableView() {
            mainView.tableView.delegate = self
            mainView.tableView.dataSource = self
        }
    }
}

extension Scene.User.List.ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: users count
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: user cell setup
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: user click action
    }
}
