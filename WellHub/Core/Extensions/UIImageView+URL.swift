//
//  UIImageView+URL.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Kingfisher

extension UIImageView {

    func imageBy(url: URL?, placeholder: UIImage? = nil) {
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}
