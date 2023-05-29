//
//  User.Detail.View.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 23/05/23.
//

import UIKit
import SnapKit

extension Scene.User.Detail {
    
    class View: UIView, CodeView {
        
        private let header = Header()
        
        let tableView: UITableView = {
            let tableView = UITableView()
            tableView.register(Cell.self)
            return tableView
        }()
        
        init() {
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            addSubview(header)
            addSubview(tableView)
        }
        
        func setupConstraints() {
            header.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(safeAreaLayoutGuide.snp.top)
                make.horizontalEdges.equalToSuperview()
            }
            
            tableView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(header.snp.bottom)
                make.horizontalEdges.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
        
        func setupAdditionalConfiguration() {
            backgroundColor = .systemBackground
        }
        
        func setup(model: Model.UserDetail) {
            header.setup(model: model)
        }
    }
}
