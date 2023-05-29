//
//  Model.Repository.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 23/05/23.
//

extension Model {
    
    struct Repository: Decodable {
        let name: String?
        let description: String?
        let forksCount: Int?
        let stargazersCount: Int?
        let updatedAt: String?
    }
}
