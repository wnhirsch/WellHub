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
        let nodeId: String?
        let avatarUrl: String?
        let gravatarId: String?
        let url: String?
        let htmlUrl: String?
        let followersUrl: String?
        let followingUrl: String?
        let gistsUrl: String?
        let starredUrl: String?
        let subscriptionsUrl: String?
        let organizationsUrl: String?
        let reposUrl: String?
        let eventsUrl: String?
        let receivedEventsUrl: String?
        let type: String?
        let siteAdmin: Bool?
    }
}
