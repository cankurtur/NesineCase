//
//  ImageDownloadError.swift
//  NesineCase
//
//  Created by Can Kurtur on 14.05.2023.
//

import Foundation

public enum ImageDownloadError: Error {
    case downloadFailed
    
    public var message: String {
        switch self {
        case .downloadFailed:
            return "Download Failed"
        }
    }
}
