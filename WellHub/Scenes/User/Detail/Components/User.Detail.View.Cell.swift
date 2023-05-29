//
//  User.Detail.View.Cell.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 29/05/23.
//

import UIKit
import SnapKit

extension Scene.User.Detail {
    
    class Cell: UITableViewCell, CodeView {
        
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.alignment = .fill
            stackView.distribution = .fill
            return stackView
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textColor = .label
            return label
        }()
        
        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14, weight: .regular)
            label.textColor = .secondaryLabel
            label.numberOfLines = 2
            return label
        }()
        
        private let infoStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 12
            stackView.alignment = .leading
            stackView.distribution = .fillProportionally
            return stackView
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            infoStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        }
        
        func buildViewHierarchy() {
            addSubview(stackView)
            
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(descriptionLabel)
            stackView.addArrangedSubview(infoStackView)
        }
        
        func setupConstraints() {
            stackView.snp.makeConstraints{ (make) -> Void in
                make.verticalEdges.equalToSuperview().inset(8)
                make.horizontalEdges.equalToSuperview().inset(16)
            }
        }
        
        func setupAdditionalConfiguration() {
            selectionStyle = .none
        }
        
        func setup(model: Model.Repository) {
            nameLabel.text = model.name
            descriptionLabel.text = model.description
            
            if let stargazersCount = model.stargazersCount, stargazersCount > 0 {
                createInfoItem(icon: "star", info: "\(stargazersCount)")
            }
            if let forksCount = model.forksCount, forksCount > 0 {
                createInfoItem(icon: "arrow.branch", info: "\(forksCount)")
            }
            if let updatedAt = model.updatedAt, let date = updatedAt.toDate() {
                createInfoItem(info: "last.update".localizedWithArgs(
                    context: .userDetail,
                    [date.toString(format: Date.githubLastUpdateFormat)]
                ))
            }
        }
        
        private func createInfoItem(icon: String? = nil, info: String) {
            if let icon = icon {
                let imageView = UIImageView(image: UIImage.init(systemName: icon))
                imageView.tintColor = .secondaryLabel
                imageView.snp.makeConstraints{ (make) -> Void in
                    make.size.equalTo(16)
                }
                infoStackView.addArrangedSubview(imageView)
                infoStackView.setCustomSpacing(4, after: imageView)
            }
            
            let label = UILabel()
            label.font = .systemFont(ofSize: 12, weight: .regular)
            label.textColor = .secondaryLabel
            label.text = info
            infoStackView.addArrangedSubview(label)
        }
    }
}

/*
 - name no topo
 - description embaixo
 linha unica com varias infos juntas:
 - language
 - stargazers_count
 - forks_count arrow.branch
 - updated_at mostrar a data como "dia Mes, Ano"
 
 
 
 */
