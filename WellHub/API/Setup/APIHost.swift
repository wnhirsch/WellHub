//
//  APIHost.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Foundation

enum APIHost {
    
    static var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    static var itemsPerPage: Int {
        return 30
    }
}
