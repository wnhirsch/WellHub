//
//  APITarget.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Moya

protocol APITarget: TargetType {
    var endPoint: Endpoint { get }
    var defaultJSONEncoder: JSONEncoder { get }
}

extension APITarget {

    var baseURL: URL {
        return APIHost.baseURL
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return nil
    }

    var endPoint: Endpoint {
        return Endpoint(
            url: "\(baseURL)\(path)",
            sampleResponseClosure: { .networkResponse(200, self.sampleData) },
            method: method,
            task: task,
            httpHeaderFields: headers
        )
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var defaultJSONEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }

    func jsonEncoder(dateFormat: String) -> JSONEncoder {
        let encoder = defaultJSONEncoder

        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        encoder.dateEncodingStrategy = .formatted(formatter)

        return encoder
    }

    func sessionHeader() -> [String: String]? {
        return [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28"
        ]
    }
}
