//
//  Model.User.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

extension Model {
    
    struct User: Decodable {
        let login: String?
        let id: Int?
        let avatarUrl: String?
    }
}
