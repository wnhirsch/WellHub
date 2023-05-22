//
//  Coordinator.User.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import UIKit

extension Coordinator {
    
    class User: CoordinatorProtocol {

        var childCoordinator: CoordinatorProtocol?
        weak var childDelegate: ChildCoordinatorDelegate?

        var containerViewController: UIViewController {
            return navigationController
        }
        
        private let navigationController = UINavigationController()
        
        func start() {
            let vc = Scene.User.List.ViewController(viewModel: .init(coordinator: self))
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
}
