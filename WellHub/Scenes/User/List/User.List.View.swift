//
//  User.List.View.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import UIKit
import SnapKit

extension Scene.User.List {
    
    class View: UIView, CodeView {
        
        let tableView = UITableView()
        
        init() {
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            addSubview(tableView)
        }
        
        func setupConstraints() {
            tableView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
                make.horizontalEdges.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
        func setupAdditionalConfiguration() {
            backgroundColor = .systemBackground
            tableView.backgroundColor = .clear
        }
    }
}
