//
//  MoyaResponse+Map.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Moya

extension Moya.Response {

    func mapObject<T: Decodable>(_ type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try map(type, using: decoder)
    }
}
