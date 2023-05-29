//
//  Model.UserDetail.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 23/05/23.
//

extension Model {
    
    struct UserDetail: Decodable {
        let login: String?
        let avatarUrl: String?
        let name: String?
        let company: String?
        let blog: String?
        let location: String?
        let email: String?
        let bio: String?
        let publicRepos: Int?
        let followers: Int?
        let following: Int?
    }
}
