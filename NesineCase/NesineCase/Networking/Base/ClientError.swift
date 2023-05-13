//
//  ClientError.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

class ClientError: APIError {
    var errorMessage: String
    var statusCode: Int?
}
