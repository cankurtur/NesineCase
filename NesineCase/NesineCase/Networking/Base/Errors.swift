//
//  Errors.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

protocol APIError: Codable, AnyObject {
    var errorMessage: String { get }
    var statusCode: Int? { get set }
}

enum APIClientError: Error {
    case handledError(error: APIError)
    case networkError
    case decoding(error: DecodingError?)
    case timeout
    case invalidStatusCode
    case badRequest
    
    var message: String {
        switch self {
        case .handledError(let error):
            return error.errorMessage
        case .networkError:
            return "Connection Error"
        case .decoding:
            return "Decoding Error"
        case .timeout:
            return "Timeout"
        case .invalidStatusCode:
            return "Invalid status code"
        case .badRequest:
            return "Bad request"
        }
    }
    
    var statusCode: Int {
        switch self {
        case .handledError:
            return 400
        case .networkError:
            return NSURLErrorTimedOut
        case .decoding:
            return NSURLErrorCannotDecodeRawData
        case .timeout:
            return 400
        case .invalidStatusCode:
            return 0
        case .badRequest:
            return 0
        }
    }
}
