//
//  NetworkManagerProtocol.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    associatedtype EndpointItem: Endpoint
    
    func request<T: Decodable>(
        endpoint: EndpointItem,
        responseType: T.Type,
        networkCompletion: @escaping NetworkHandler<T>
    )
}
