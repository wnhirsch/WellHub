//
//  Coordinator.App.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import UIKit

extension Coordinator {
    
    class App {

        private let window: UIWindow
        private(set) var childCoordinator: CoordinatorProtocol?

        init(window: UIWindow) {
            self.window = window
        }

        func start() {
            let userCoordinator = Coordinator.User()
            userCoordinator.start()
            childCoordinator = userCoordinator
            window.rootViewController = userCoordinator.containerViewController
            window.makeKeyAndVisible()
        }

    }
}
