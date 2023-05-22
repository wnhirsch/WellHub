//
//  Loadable.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import UIKit

protocol Loadable {
    func showLoading(message: String?, on subview: UIView?)
    func hideLoading()
}

extension Loadable where Self: UIViewController {

    private func findLoadingView() -> Scene.Components.LoadingView? {
        return view.subviews.compactMap { $0 as? Scene.Components.LoadingView }.first
    }

    private func addLoadingView(subview: UIView? = nil) -> Scene.Components.LoadingView {
        let loadingView = Scene.Components.LoadingView()
        loadingView.startAnimating()
        loadingView.alpha = 0

        view.addSubview(loadingView)
        
        if let view = subview ?? view {
            loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }

        return loadingView
    }

    // MARK: - Public
    func showLoading(message: String? = nil, on subview: UIView? = nil) {
        view.endEditing(true)
        
        if let loadingView = findLoadingView() {
            loadingView.setup(message: message)
            view.bringSubviewToFront(loadingView)
            return
        }

        let loadingView = addLoadingView(subview: subview)
        loadingView.setup(message: message)
        loadingView.alpha = 1
    }

    func hideLoading() {
        guard let loadingView = findLoadingView() else {
            return
        }

        UIView.animate(withDuration: 0.25, animations: {
            loadingView.alpha = 0
        }, completion: { _ in
            loadingView.stopAnimating()
            loadingView.removeFromSuperview()
        })
    }
    
}
