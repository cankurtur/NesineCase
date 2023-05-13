//
//  Endpoint.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var params: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
    var baseHeaders: HTTPHeaders? { get }
    var url: String { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    
    var baseUrl: String {
        return Config.shared.iTunesBaseURL
    }
    
    var url: String {
        return "\(baseUrl)\(path)"
    }
    
    var params: [String: Any]? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        let headers = baseHeaders
        return headers
    }
    
    var baseHeaders: HTTPHeaders? {
        let acceptHeader = HTTPHeader(name: "Accept", value: "application/json")
        let contentTypeHeader = HTTPHeader(name: "Content-Type", value: "application/json")
        
        return HTTPHeaders(
            headers: [acceptHeader, contentTypeHeader]
        )
    }
}
