//
//  User.List.View.Cell.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import UIKit
import SnapKit

extension Scene.User.List {
    
    class Cell: UITableViewCell, CodeView {
        
        private let avatarImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage.init(systemName: "person.circle"))
            imageView.layer.cornerRadius = 30
            imageView.clipsToBounds = true
            imageView.tintColor = .label
            return imageView
        }()
        
        private let loginLabel = UILabel()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            addSubview(avatarImageView)
            addSubview(loginLabel)
        }
        
        func setupConstraints() {
            avatarImageView.snp.makeConstraints{ (make) -> Void in
                make.leading.equalToSuperview().offset(16)
                make.top.equalToSuperview().offset(8)
                make.bottom.lessThanOrEqualToSuperview().inset(8)
                make.size.equalTo(60)
            }
            
            loginLabel.snp.makeConstraints{ (make) -> Void in
                make.top.greaterThanOrEqualToSuperview().offset(8)
                make.bottom.lessThanOrEqualToSuperview().inset(8)
                make.centerY.equalToSuperview()
                make.leading.equalTo(avatarImageView.snp.trailing).offset(12)
                make.trailing.equalToSuperview().inset(16)
            }
        }
        
        func setupAdditionalConfiguration() { }
        
        func setup(login: String?, avatarUrl: String?) {
            loginLabel.text = login
            avatarImageView.imageBy(
                url: URL(string: avatarUrl ?? ""),
                placeholder: UIImage.init(systemName: "person.circle")
            )
        }
        
    }
    
}
