//
//  Typealias.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

typealias NetworkHandler<T> = (Result<T, APIClientError>) -> Void where T: Decodable
