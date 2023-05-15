//
//  SearchResponse.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Codable {
    let screenshotUrls: [String]?
}
