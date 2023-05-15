//
//  SearchEndpointItem.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

enum SearchEndpointItem: Endpoint {
case search(searchKey: String)
    
    var path: String {
        switch self {
        case .search(let searchKey):
            var URLComponents = URLComponents()
            URLComponents.path = "/search"
            URLComponents.queryItems = [
                URLQueryItem(name: "media", value: Config.shared.searchMediaType),
                URLQueryItem(name: "term", value: searchKey)]
            
            return URLComponents.url?.absoluteString ?? ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }

}
