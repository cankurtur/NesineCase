//
//  HTTPHeaders.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

struct HTTPHeaders {
    private var headers: [HTTPHeader] = []
    
    init() { }
    
    var asDictionary: [String: String] {
        var dictionary: [String: String] = [:]
        
        headers.forEach { header in
            dictionary[header.name] = header.value
        }
        return dictionary
    }
    
    init(headers: [HTTPHeader]) {
        self.init()
        self.headers = headers
    }
    
    mutating func add(_ header: HTTPHeader) {
        self.headers.append(header)
    }
    
    func embed(into request: URLRequest) -> URLRequest {
        var request = request
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.name)
        }
        
        return request
    }
}
