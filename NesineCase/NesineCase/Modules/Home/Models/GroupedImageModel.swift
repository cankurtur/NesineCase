//
//  GroupedImageModel.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

// MARK: - ImageSize

enum ImageSize {
    case low
    case normal
    case high
    case superHigh
    
    var sectionName: String {
        switch self {
        case .low:
            return Localizable.imageSizeLowSectionTitle
        case .normal:
            return Localizable.imageSizeNormalSectionTitle
        case .high:
            return Localizable.imageSizeHighSectionTitle
        case .superHigh:
            return Localizable.imageSizeSuperHighSectionTitle
        }
    }
}

// MARK: - GroupedImageModel

struct GroupedImageModel {
    let size: ImageSize
    let images: [Data]
}
