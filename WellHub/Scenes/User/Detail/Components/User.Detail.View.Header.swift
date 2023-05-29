//
//  User.Detail.View.Header.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 23/05/23.
//

import UIKit
import SnapKit

extension Scene.User.Detail {
    
    class Header: UIView, CodeView {
        
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.alignment = .fill
            stackView.distribution = .fill
            return stackView
        }()
        
        private let avatarImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 60
            imageView.clipsToBounds = true
            imageView.tintColor = .label
            return imageView
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textColor = .label
            label.textAlignment = .center
            return label
        }()
        
        private let loginLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .light)
            label.textColor = .secondaryLabel
            label.textAlignment = .center
            return label
        }()
        
        private let bioLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .regular)
            label.textColor = .label
            label.textAlignment = .center
            label.numberOfLines = 2
            return label
        }()
        
        private let lineView: UIView = {
            let view = UIView()
            view.backgroundColor = .secondaryLabel
            return view
        }()
        
        init() {
            super.init(frame: .zero)
            setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func buildViewHierarchy() {
            addSubview(avatarImageView)
            addSubview(stackView)
            addSubview(lineView)
            
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(loginLabel)
            stackView.addArrangedSubview(bioLabel)
        }
        
        func setupConstraints() {
            avatarImageView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(safeAreaLayoutGuide.snp.top)
                make.size.equalTo(120)
                make.centerX.equalToSuperview()
            }
            
            stackView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(avatarImageView.snp.bottom).offset(8)
                make.horizontalEdges.equalToSuperview().inset(16)
            }
            
            lineView.snp.makeConstraints{ (make) -> Void in
                make.top.equalTo(stackView.snp.bottom).offset(16)
                make.horizontalEdges.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
            
            stackView.setCustomSpacing(8, after: loginLabel)
            stackView.setCustomSpacing(16, after: bioLabel)
        }
        
        func setupAdditionalConfiguration() {
            backgroundColor = .systemBackground
        }
        
        func setup(model: Model.UserDetail) {
            avatarImageView.imageBy(
                url: URL(string: model.avatarUrl ?? ""),
                placeholder: UIImage.init(systemName: "person.circle")
            )
            
            loginLabel.text = model.login
            nameLabel.text = model.name
            bioLabel.text = model.bio?.replacingOccurrences(of: "\r\n", with: " ")
            
            createInfoItem(
                icon: "person.2",
                info: "follow.message.count".localizedWithArgs(
                    context: .userDetail,
                    [model.followers ?? 0, model.following ?? 0]
                )
            )
            if let company = model.company, !company.isEmpty {
                createInfoItem(icon: "building.2", info: company)
            }
            if let location = model.location, !location.isEmpty {
                createInfoItem(icon: "mappin.and.ellipse", info: location)
            }
            if let email = model.email, !email.isEmpty {
                createInfoItem(icon: "envelope", info: email)
            }
            if let blog = model.blog, !blog.isEmpty {
                createInfoItem(icon: "link", info: blog)
            }
        }
        
        private func createInfoItem(icon: String, info: String) {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .leading
            stackView.distribution = .fillProportionally
            
            let imageView = UIImageView(image: UIImage.init(systemName: icon))
            imageView.tintColor = .label
            imageView.snp.makeConstraints{ (make) -> Void in
                make.size.equalTo(16)
            }
            stackView.addArrangedSubview(imageView)
            
            let label = UILabel()
            label.font = .systemFont(ofSize: 14, weight: .regular)
            label.textColor = .secondaryLabel
            label.textAlignment = .left
            label.text = info
            stackView.addArrangedSubview(label)
            
            self.stackView.addArrangedSubview(stackView)
            self.stackView.setCustomSpacing(4, after: stackView)
        }
    }
}
