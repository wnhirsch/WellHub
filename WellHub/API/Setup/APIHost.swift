//
//  APIHost.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Foundation

enum APIHost {
    
    static var baseURL: URL {
        URL(string: "https://api.github.com")!
    }
    
    static var itemsPerPage: Int {
        30
    }
    
    // Change it to use the API with a bigger request limit
    static var accessToken: String {
        "YOUR_ACCESS_TOKEN"
    }
}
