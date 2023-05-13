//
//  HTTPMethod.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

struct HTTPMethod: RawRepresentable, Equatable {
    
    static let connect = HTTPMethod(rawValue: "CONNECT")
    static let delete = HTTPMethod(rawValue: "DELETE")
    static let get = HTTPMethod(rawValue: "GET")
    static let head = HTTPMethod(rawValue: "HEAD")
    static let options = HTTPMethod(rawValue: "OPTIONS")
    static let patch = HTTPMethod(rawValue: "PATCH")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    static let query = HTTPMethod(rawValue: "QUERY")
    static let trace = HTTPMethod(rawValue: "TRACE")

    let rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
}

extension HTTPMethod {
    var encoding: ParameterEncoding {
        switch self {
        case .get:
            return .url
        default:
            return.json
        }
    }
}
