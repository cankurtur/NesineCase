//
//  URLResponseExtension.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

extension URLResponse {
    var code: Int? {
        guard let response = self as? HTTPURLResponse else {
            return nil
        }
        
        return response.statusCode
    }
}
