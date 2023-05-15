//
//  HTTPHeader.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

struct HTTPHeader {
    let name: String
    let value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
