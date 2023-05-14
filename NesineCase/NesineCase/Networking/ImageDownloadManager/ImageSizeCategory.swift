//
//  ImageSizeCategory.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

// MARK: - ImageSizeCategory

enum ImageSizeCategory: String, CaseIterable {
    case small = "0-100kb"
    case medium = "100-250kb"
    case large = "250-500kb"
    case xlarge = "500+kb"

    init(size: Int) {
        switch size {
        case 0..<100_000:
            self = .small
        case 100_000..<250_000:
            self = .medium
        case 250_000..<500_000:
            self = .large
        default:
            self = .xlarge
        }
    }
}
